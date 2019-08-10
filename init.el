;; START
(setq inhibit-startup-screen t)
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
;;(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
;; *************************************************************************
;; ******************             GENERAL          *************************
;; *************************************************************************
;;(tool-bar-mode -1)
;;(menu-bar-mode -1)
;;(scroll-bar-mode -1)

(load-theme 'obsidian)

;;(add-to-list 'load-path "~/.emacs.d/elpa/which-key-20181114.1432/which-key.el")
;;seeing if prompted for password



;;(global-set-key (kbd "M-;") 'comment-dwim-2)

;; if you need to enter input do C-u C-x c
(global-set-key (kbd "C-c k") 'compile)

(require 'window-number)
(window-number-mode)
(require 'auto-complete)

(require 'auto-complete-config)
(ac-config-default)

(require 'yasnippet)
(yas-global-mode 1)

(defun my:ac-c-header-init ()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers))
(add-hook 'c-mode-hook 'my:ac-c-header-init)

(define-key global-map (kbd "C-c ;") 'iedit-mode)

(require 'google-c-style)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

(add-hook 'text-mode-hook 'visual-line-mode)



(require 'linum)
(add-hook 'emacs-lisp-mode-hook 'linum-mode)
(add-hook 'c-mode-hook 'linum-mode)
(add-hook 'text-mode-hook 'linum-mode)
(add-hook 'shell-script-mode 'linum-mode)
;;(add-hook 'emacs-lisp-mode-hook #'linum-on)
;; put a space between line numbers and buffer
(setq linum-format "%d  ")
(set-face-foreground 'linum "color-163")
(set-face-background 'linum "black")


(semantic-mode 1)
(defun my:add-semantic-to-autocomplete()
  (add-to-list 'ac-sources 'ac-source-semantic)
)
(add-hook 'c-mode-common-hook 'my:add-semantic-to-autocomplete)

(global-semantic-idle-scheduler-mode 1)


(show-paren-mode 1)
(require 'paren)
(set-face-background 'show-paren-match "color-163")
(set-face-attribute 'show-paren-match nil :weight 'extra-bold)

;;provides function arg help in the minibuffer
;;(add-hook 'c-mode-hook 'c-turn-on-eldoc-mode)

;; (defun my:flymake-google-init()
;;  (require 'flymake-google-cpplint)
;;  (flymake-google-cpplint-load)
;;)
;;(add-hook 'c-mode-hook 'my:flymake-google-init)
;;(add-hook 'c++-mode-hook 'my:flymake-google-init)

;;(defun my-c-mode-insert-lcurly ()
  ;;(interactive)
  ;;(insert "{")
  ;;(let ((pps (syntax-ppss)))
    ;;(when (and (eolp) (not (or (nth 3 pps) (nth 4 pps)))) ;; EOL and not in string or comment
      ;;(c-indent-line)
      ;;(insert "\n\n}")
      ;;(c-indent-line)
      ;;(forward-line -1)
      ;;(c-indent-line))))

;;(define-key c-mode-base-map "{" 'my-c-mode-insert-lcurly)
(electric-pair-mode 1)		    

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("6e32d7aab92ad2ad4d3a915cd9ace5dc1d9d8f0486b785bdb86c79ff5ca0c189" default)))
 '(menu-bar-mode nil)
 '(package-selected-packages
   (quote
    (format-sql sql-indent sqlup-mode c-eldoc comment-dwim-2 window-number obsidian-theme)))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "unspecified-bg" :foreground "unspecified-fg" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 50 :width normal :foundry "default" :family "default")))))
