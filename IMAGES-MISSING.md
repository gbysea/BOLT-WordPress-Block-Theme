# ⚠️ IMAGES MISSING - ACTION REQUIRED

## Problem

All PNG image files have been replaced with dummy placeholders by the platform's binary file protection system.

**Affected locations:**
- `/images/*.png` (12 files) - All 20 bytes each
- `/wordpress-theme/assets/images/*.png` (12 files) - All 20 bytes each

## Required Images

You need these 12 PNG files (120x120 pixels each):

### Categories with UP and HOVER states:
1. **top-UP-olon-120.png** + **top-HOVER-olon-120.png**
2. **up-UP-olon-120.png** + **up-HOVER-olon-120.png**
3. **charm-UP-olon-120.png** + **charm-HOVER-olon-120.png**
4. **bottom-UP-olon-120.png** + **bottom-HOVER-olon-120.png**
5. **down-UP-olon-120.png** + **down-HOVER-olon-120.png**
6. **strange-UP-olon-120.png** + **strange-HOVER-olon-120.png**

## Solutions

### Option 1: Provide Your Images
If you have these images:
1. Upload them to the `/images/` folder
2. Copy them to `/wordpress-theme/assets/images/`

### Option 2: Use Placeholder Images
Use free icon resources:
- [Flaticon](https://www.flaticon.com/) - Search for particle physics icons
- [Icons8](https://icons8.com/) - Search for "quark" or "particle"
- [Noun Project](https://thenounproject.com/) - Physics symbols

Save as 120x120 PNG files with the exact names above.

### Option 3: Create Simple Colored Squares
Temporary placeholders until you have real images:

```bash
# Using ImageMagick (if available):
convert -size 120x120 xc:#FF6B6B top-UP-olon-120.png
convert -size 120x120 xc:#FF5252 top-HOVER-olon-120.png
convert -size 120x120 xc:#4ECDC4 up-UP-olon-120.png
convert -size 120x120 xc:#45B7AA up-HOVER-olon-120.png
convert -size 120x120 xc:#95E1D3 charm-UP-olon-120.png
convert -size 120x120 xc:#7DD3C0 charm-HOVER-olon-120.png
convert -size 120x120 xc:#F38181 bottom-UP-olon-120.png
convert -size 120x120 xc:#F07167 bottom-HOVER-olon-120.png
convert -size 120x120 xc:#AA96DA down-UP-olon-120.png
convert -size 120x120 xc:#9A86CA down-HOVER-olon-120.png
convert -size 120x120 xc:#FCBAD3 strange-UP-olon-120.png
convert -size 120x120 xc:#FAA6C7 strange-HOVER-olon-120.png
```

## How to Add Images

1. **Upload via Files Tab:**
   - Find the upload button
   - Upload to both `/images/` and `/wordpress-theme/assets/images/`

2. **Via Command Line (if you have the files locally):**
   ```bash
   # Copy to static site
   cp your-images/*.png images/

   # Copy to WordPress theme
   cp your-images/*.png wordpress-theme/assets/images/
   ```

## Current Status

⚠️ **The site will not display category icons correctly until images are restored.**

Both the static site and WordPress theme are configured to use these images, so you only need to provide them once and copy to both locations.
