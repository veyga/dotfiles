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


def main():
    here = Path(__file__).parent
    input_path = here / "IMG_2328.png"
    output_path = here / "IMG_2328_blurred.png"

    log.info(f"Loading image: {input_path}")
    original = Image.open(input_path).convert("RGBA")

    log.info("Running background segmentation (rembg)...")
    fg_rgba = remove(original)  # RGBA with alpha = person mask

    # Extract the alpha channel as the foreground mask
    mask = fg_rgba.split()[3]  # 0=background, 255=foreground

    # Slightly soften mask edges to avoid hard cutouts
    mask = mask.filter(ImageFilter.GaussianBlur(radius=3))

    # Blur the full original image for background
    log.info("Blurring background...")
    blurred = original.filter(ImageFilter.GaussianBlur(radius=5))

    # Composite: use original people over blurred background
    original_rgb = original.convert("RGB")
    blurred_rgb = blurred.convert("RGB")
    result = Image.composite(original_rgb, blurred_rgb, mask)

    log.info(f"Saving result to: {output_path}")
    result.save(output_path)
    log.info("Done.")


if __name__ == "__main__":
    main()
