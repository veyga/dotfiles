#!/usr/bin/env -S uv run --script
# /// script
# requires-python = ">=3.13"
# dependencies = [
# "debugpy",
# "coloredlogs",
# "rembg[cpu]",
# "opencv-python",
# "pillow",
# "numpy",
# ]
# ///

import os, coloredlogs, logging
from pathlib import Path
import numpy as np
import cv2
from PIL import Image, ImageFilter
from rembg import remove

if os.getenv("ENABLE_DEBUG"):
    import debugpy
    debugpy.listen(("0.0.0.0", 5680))
    debugpy.wait_for_client()

log = logging.getLogger("go.py")
coloredlogs.install(
    level="DEBUG",
    fmt="%(asctime)s %(name)s %(levelname)-8s %(message)s",
    field_styles={"levelname": {"color": "cyan", "bold": False}},
)


def detect_and_remove_background_face(img_cv):
    """Detect all faces, inpaint the smallest one (background person between the two subjects)."""
    gray = cv2.cvtColor(img_cv, cv2.COLOR_BGR2GRAY)

    cascade_path = cv2.data.haarcascades + "haarcascade_frontalface_default.xml"
    detector = cv2.CascadeClassifier(cascade_path)
    faces = detector.detectMultiScale(gray, scaleFactor=1.1, minNeighbors=5, minSize=(30, 30))

    if len(faces) == 0:
        log.warning("No faces detected, skipping face removal")
        return img_cv

    log.info(f"Detected {len(faces)} face(s): {faces}")

    # Sort by area descending — the two main subjects are largest
    faces_sorted = sorted(faces, key=lambda f: f[2] * f[3], reverse=True)

    if len(faces_sorted) <= 2:
        log.warning("Only 2 or fewer faces found — nothing to remove")
        return img_cv

    # Build inpainting mask for all faces beyond the top 2
    mask = np.zeros(img_cv.shape[:2], dtype=np.uint8)
    for x, y, w, h in faces_sorted[2:]:
        # Expand the mask region slightly to cover hair/neck
        pad_x = int(w * 0.3)
        pad_y = int(h * 0.4)
        x1 = max(0, x - pad_x)
        y1 = max(0, y - pad_y)
        x2 = min(img_cv.shape[1], x + w + pad_x)
        y2 = min(img_cv.shape[0], y + h + pad_y)
        cv2.ellipse(mask, ((x1 + x2) // 2, (y1 + y2) // 2), ((x2 - x1) // 2, (y2 - y1) // 2), 0, 0, 360, 255, -1)
        log.info(f"Masking background face at ({x1},{y1})-({x2},{y2})")

    # Inpaint to fill masked region with surrounding content
    result = cv2.inpaint(img_cv, mask, inpaintRadius=15, flags=cv2.INPAINT_TELEA)
    return result


def main():
    here = Path(__file__).parent
    input_path = here / "IMG_2328.png"
    output_path = here / "IMG_2328_no_bg_face.png"

    log.info(f"Loading image: {input_path}")
    original_pil = Image.open(input_path).convert("RGBA")

    # --- Step 1: Remove background face via inpainting ---
    log.info("Detecting and removing background face...")
    img_cv = cv2.cvtColor(np.array(original_pil.convert("RGB")), cv2.COLOR_RGB2BGR)
    img_cv = detect_and_remove_background_face(img_cv)
    # Convert back to PIL RGBA
    inpainted_pil = Image.fromarray(cv2.cvtColor(img_cv, cv2.COLOR_BGR2RGB)).convert("RGBA")

    # --- Step 2: Background blur using rembg segmentation ---
    log.info("Running background segmentation (rembg)...")
    fg_rgba = remove(inpainted_pil)
    mask = fg_rgba.split()[3]
    mask = mask.filter(ImageFilter.GaussianBlur(radius=3))

    log.info("Blurring background...")
    blurred = inpainted_pil.filter(ImageFilter.GaussianBlur(radius=5))

    original_rgb = inpainted_pil.convert("RGB")
    blurred_rgb = blurred.convert("RGB")
    result = Image.composite(original_rgb, blurred_rgb, mask)

    log.info(f"Saving result to: {output_path}")
    result.save(output_path)
    log.info("Done.")


if __name__ == "__main__":
    main()
