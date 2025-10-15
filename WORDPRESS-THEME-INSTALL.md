# OLON Sentiment TV - WordPress Theme Installation

## Source Files

The complete WordPress theme is available in the **`wordpress-theme/`** folder (32 files).

Due to platform limitations, you'll need to create the archive yourself or upload the folder directly.

## Installation Methods

### Method 1: Direct Folder Upload (Recommended)

1. **Download the folder:**
   - Download the entire `wordpress-theme/` folder from this repository

2. **Upload to WordPress:**
   - Upload the `wordpress-theme` folder to `/wp-content/themes/`
   - Rename to `olon-sentiment-tv` (optional)

3. **Configure Supabase:**

   Add to your `wp-config.php` **before** the line `/* That's all, stop editing! */`:

   ```php
   /**
    * Supabase Configuration for OLON Sentiment TV
    */
   define('SUPABASE_URL', 'https://irbflzzuamvvujebhter.supabase.co');
   define('SUPABASE_ANON_KEY', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImlyYmZsenp1YW12dnVqZWJodGVyIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjA0NDAwOTYsImV4cCI6MjA3NjAxNjA5Nn0.MaKWPrMGIZYDC7r084VnkI4Gvji5cC0c8s4kgTqXHP0');
   ```

4. **Activate:**
   - Go to Appearance → Themes in WordPress admin
   - Activate "OLON Sentiment TV"

### Method 2: Create Archive Locally

If you prefer to create an archive file:

1. **In your terminal (in the project folder):**
   ```bash
   tar -czf olon-sentiment-theme.tar.gz wordpress-theme/
   ```

2. **Upload to WordPress:**
   - Go to Appearance → Themes → Add New → Upload Theme
   - Upload the `olon-sentiment-theme.tar.gz` file
   - Activate the theme

3. **Configure Supabase** (same as Method 1)

## What's Included

- ✅ Full WordPress Block Theme (FSE compatible)
- ✅ 6 Sentiment Categories (Top, Up, Charm, Bottom, Down, Strange)
- ✅ Dynamic Aura System
- ✅ Supabase Integration
- ✅ Custom Permalinks (`/category/slug`, `/post/slug`)
- ✅ Responsive Design
- ✅ All CSS, JavaScript, and image assets

## Requirements

- WordPress 6.0+
- PHP 7.4+
- Supabase account (free tier works)

## Documentation

Full documentation is included in `wordpress-theme/README.md`

## Theme Contents

The `wordpress-theme/` folder includes:
- 32 complete files
- Full Block Theme (FSE) templates
- All CSS, JavaScript, and image assets
- Complete documentation in `wordpress-theme/README.md`

## Support

- Database is already configured and populated
- Theme uses the same Supabase instance as the static site
- All 6 categories are pre-configured with icons and data

## Important Note

Due to platform binary file restrictions, archive files (.tar.gz) are automatically replaced with dummy placeholders.

**If you see `olon-sentiment-theme.tar.gz` in the file list:**
- It will show as 20 bytes and contain `[DUMMY FILE CONTENT]`
- This is expected behavior - the platform cannot persist binary archives

**To create a working archive:**

### In Your Local Terminal (Recommended):
1. Download the `wordpress-theme/` folder to your computer
2. Run the provided script:
   ```bash
   bash create-theme-archive.sh
   ```

### Or Manually:
```bash
tar -czf olon-sentiment-theme.tar.gz wordpress-theme/
```

This will create a valid 17 KB archive with 39 files that you can upload to WordPress.
