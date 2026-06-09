-- aerostack.lua
--
-- Show app icons for AeroSpace accordion stacks (your left/right columns), so
-- you can see which apps are hidden behind the focused window in a column.
--
-- This is stackline-style indicators, but stackline only works with yabai: it
-- detects a stack by finding windows with an *identical* frame. AeroSpace's
-- accordion offsets siblings by `accordion-padding`, so they never share an
-- exact frame. Here we detect a "column" via bounding-box overlap instead, then
-- draw a vertical strip of app icons inset along the column's outer edge.
--
-- No yabai, no AeroSpace config changes: window create/move/focus events from
-- hs.window.filter drive the redraw.

local M = {}

M.config = {
  iconSize     = 32,    -- px, size of each app icon
  iconSpacing  = 8,     -- px, vertical gap between icons
  edgeInset    = 4,     -- px, how far inside the column's outer edge to draw
  vertAlign    = "top", -- "top" | "center" | "bottom" of the column
  vertPad      = 8,     -- px, inset from the top/bottom edge when not centered
  overlapRatio = 0.5,   -- min overlap (intersection / smaller-area) to be "same column"
  aerospaceBin = "/opt/homebrew/bin/aerospace", -- source of focus-stable stack order
  dimmedAlpha  = 0.45,  -- alpha for non-focused apps in a stack
  focusedAlpha = 1.0,   -- alpha for the focused / frontmost app in a stack
  debounceSecs = 0.15,  -- coalesce bursts of window events before redrawing
  showSingle   = true,  -- if true, draw an icon even for a single (non-stacked) window
}

local canvases = {}      -- pool of hs.canvas, reused across redraws
local wf                 -- hs.window.filter
local redrawTimer        -- debounce timer
local spacesWatcher
local screenWatcher

-- intersection area / smaller-window area, for two frames
local function overlapRatio(a, b)
  local x1 = math.max(a.x, b.x)
  local y1 = math.max(a.y, b.y)
  local x2 = math.min(a.x + a.w, b.x + b.w)
  local y2 = math.min(a.y + a.h, b.y + b.h)
  local iw, ih = x2 - x1, y2 - y1
  if iw <= 0 or ih <= 0 then return 0 end
  local minArea = math.min(a.w * a.h, b.w * b.h)
  if minArea <= 0 then return 0 end
  return (iw * ih) / minArea
end

-- union rectangle covering every window's frame in the list
local function unionFrame(wins)
  local f = wins[1]:frame()
  local minx, miny = f.x, f.y
  local maxx, maxy = f.x + f.w, f.y + f.h
  for i = 2, #wins do
    local g = wins[i]:frame()
    minx = math.min(minx, g.x)
    miny = math.min(miny, g.y)
    maxx = math.max(maxx, g.x + g.w)
    maxy = math.max(maxy, g.y + g.h)
  end
  return { x = minx, y = miny, w = maxx - minx, h = maxy - miny }
end

-- AeroSpace's stack order as windowId -> index. This is the only focus-stable
-- ordering source: for 3+ window accordions, AeroSpace collapses the unfocused
-- windows so their on-screen positions shift and collide as you navigate, but
-- the underlying tree order never changes on focus. AeroSpace and Hammerspoon
-- share window ids. The list runs opposite to physical top->bottom, so callers
-- sort DESCENDING by this index. It does change when a window is moved/closed.
local function aerospaceOrder()
  local out = hs.execute(M.config.aerospaceBin .. " list-windows --all --format '%{window-id}'")
  local order, i = {}, 0
  if out then
    for line in out:gmatch("[^\r\n]+") do
      local id = tonumber(line:match("%d+"))
      if id then
        i = i + 1
        order[id] = i
      end
    end
  end
  return order
end

-- Group visible standard windows into accordion columns by overlap.
-- Returns a list of { wins = {...front-to-back...}, frame = repFrame, screen = id }.
local function computeStacks()
  local groups = {}
  -- orderedWindows() is front-to-back, so wins[1] of each group is the visible one
  for _, win in ipairs(hs.window.orderedWindows()) do
    if win:isStandard() and not win:isMinimized() and win:screen() then
      local f = win:frame()
      local sid = win:screen():id()
      local placed = false
      for _, grp in ipairs(groups) do
        if grp.screen == sid and overlapRatio(grp.frame, f) >= M.config.overlapRatio then
          table.insert(grp.wins, win)
          placed = true
          break
        end
      end
      if not placed then
        table.insert(groups, { wins = { win }, frame = f, screen = sid })
      end
    end
  end
  return groups
end

local function ensureCanvas(i)
  if not canvases[i] then
    local cv = hs.canvas.new({ x = 0, y = 0, w = 10, h = 10 })
    cv:level(hs.canvas.windowLevels.floating)
    canvases[i] = cv
  end
  return canvases[i]
end

local function redraw()
  local cfg = M.config
  local minCount = cfg.showSingle and 1 or 2
  local focused = hs.window.focusedWindow()
  local focusedId = focused and focused:id()
  local order = aerospaceOrder()
  local used = 0

  for _, grp in ipairs(computeStacks()) do
    local n = #grp.wins
    if n >= minCount then
      used = used + 1
      local screenFrame = grp.wins[1]:screen():frame()
      local u = unionFrame(grp.wins)

      -- Stable order: sort by AeroSpace's stack order, DESCENDING (its list runs
      -- opposite to physical top->bottom), so the top icon is the top of the
      -- accordion. This is focus-stable -- unlike on-screen geometry, which shifts
      -- and collides for 3+ window stacks as you navigate. window-id is the final
      -- tiebreaker so order never depends on focus/z-order. The strip only
      -- re-orders when a window is actually moved/joined or closed.
      table.sort(grp.wins, function(p, q)
        local op = order[p:id()] or -math.huge
        local oq = order[q:id()] or -math.huge
        if op ~= oq then return op > oq end
        return p:id() < q:id()
      end)

      -- outer edge = the side of the column nearest the screen edge
      local onLeft = (u.x + u.w / 2) < (screenFrame.x + screenFrame.w / 2)

      local stripH = n * cfg.iconSize + (n - 1) * cfg.iconSpacing
      local startY
      if cfg.vertAlign == "center" then
        startY = u.y + (u.h - stripH) / 2
      elseif cfg.vertAlign == "bottom" then
        startY = u.y + u.h - stripH - cfg.vertPad
      else -- "top"
        startY = u.y + cfg.vertPad
      end
      local x = onLeft
        and (u.x + cfg.edgeInset)
        or  (u.x + u.w - cfg.iconSize - cfg.edgeInset)

      local cv = ensureCanvas(used)
      cv:frame({ x = x, y = startY, w = cfg.iconSize, h = stripH })
      cv:replaceElements() -- clear previous icons

      for idx, win in ipairs(grp.wins) do
        local app = win:application()
        local bundle = app and app:bundleID()
        local img = bundle and hs.image.imageFromAppBundle(bundle)
        if img then
          local isFocused = win:id() == focusedId
          cv:appendElements({
            type = "image",
            image = img,
            imageScaling = "scaleToFit",
            imageAlpha = isFocused and cfg.focusedAlpha or cfg.dimmedAlpha,
            frame = {
              x = 0,
              y = (idx - 1) * (cfg.iconSize + cfg.iconSpacing),
              w = cfg.iconSize,
              h = cfg.iconSize,
            },
          })
        end
      end
      cv:show()
    end
  end

  -- hide any canvases left over from a previous, larger draw
  for i = used + 1, #canvases do
    canvases[i]:hide()
  end
end

local function scheduleRedraw()
  if redrawTimer then redrawTimer:stop() end
  redrawTimer = hs.timer.doAfter(M.config.debounceSecs, redraw)
end

function M:start()
  wf = hs.window.filter.new()
  wf:subscribe({
    hs.window.filter.windowCreated,
    hs.window.filter.windowDestroyed,
    hs.window.filter.windowMoved, -- fires on move and resize
    hs.window.filter.windowFocused,
    hs.window.filter.windowUnfocused,
    hs.window.filter.windowMinimized,
    hs.window.filter.windowUnminimized,
    hs.window.filter.windowFullscreened,
    hs.window.filter.windowUnfullscreened,
    hs.window.filter.windowVisible,
    hs.window.filter.windowNotVisible,
  }, scheduleRedraw)

  spacesWatcher = hs.spaces.watcher.new(scheduleRedraw):start()
  screenWatcher = hs.screen.watcher.new(scheduleRedraw):start()

  scheduleRedraw()
  return self
end

function M:stop()
  if wf then wf:unsubscribeAll(); wf = nil end
  if spacesWatcher then spacesWatcher:stop(); spacesWatcher = nil end
  if screenWatcher then screenWatcher:stop(); screenWatcher = nil end
  if redrawTimer then redrawTimer:stop(); redrawTimer = nil end
  for _, cv in ipairs(canvases) do cv:delete() end
  canvases = {}
end

function M:init()
  return self:start()
end

return M
