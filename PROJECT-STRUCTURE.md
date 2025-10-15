# OLON Sentiment TV - Complete Project Structure

## Overview

This project contains both a static website and a WordPress theme for the OLON Sentiment TV platform.

**Total Files:** 74 files across all directories

---

## 📁 Root Directory Files

### HTML Pages (Static Site)
- `index.html` - Homepage with category grid
- `category.html` - Category archive page template
- `post.html` - Single post page template

### Configuration Files
- `.env` - Supabase credentials (DO NOT COMMIT)
- `.env.example` - Template for environment variables
- `.npmrc` - NPM configuration
- `package.json` - Project dependencies and scripts
- `package-lock.json` - Locked dependency versions
- `netlify.toml` - Netlify deployment configuration
- `_redirects` - URL redirect rules

### Documentation
- `SETUP-INSTRUCTIONS.md` - Initial setup guide
- `WORDPRESS-THEME-INSTALL.md` - WordPress theme installation guide
- `PROJECT-STRUCTURE.md` - This file

### Scripts
- `setup-codespace.sh` - GitHub Codespaces setup script

---

## 📁 /css/ - Static Site Stylesheets (4 files)

- `variables.css` - CSS custom properties and theme variables
- `base.css` - Base styles, typography, layout
- `components.css` - Component-specific styles
- `aura.css` - Aura animation effects

---

## 📁 /js/ - Static Site JavaScript (6 files)

- `supabase-client.js` - Supabase connection and API calls
- `main.js` - Application entry point
- `categories.js` - Category rendering and navigation
- `posts.js` - Post fetching and display
- `aura.js` - Dynamic aura effects
- `header-logo.js` - Animated header logo

---

## 📁 /images/ - Category Icons (12 files)

Each of the 6 categories has 2 states (UP and HOVER):

- `top-UP-olon-120.png` / `top-HOVER-olon-120.png`
- `up-UP-olon-120.png` / `up-HOVER-olon-120.png`
- `charm-UP-olon-120.png` / `charm-HOVER-olon-120.png`
- `bottom-UP-olon-120.png` / `bottom-HOVER-olon-120.png`
- `down-UP-olon-120.png` / `down-HOVER-olon-120.png`
- `strange-UP-olon-120.png` / `strange-HOVER-olon-120.png`

---

## 📁 /supabase/ - Database Migrations (4 files)

- `migrations/20251014162218_add_olon_category_fields.sql` - Add category schema
- `migrations/20251014162252_populate_olon_category_data.sql` - Populate categories
- `migrations/20251014185416_fix_security_issues.sql` - RLS policies
- `migrations/20251014221439_add_icon_fields_to_categories.sql` - Add icon columns

---

## 📁 /wordpress-theme/ - WordPress Block Theme (32 files)

### Root Files
- `style.css` - Theme metadata and stylesheet
- `theme.json` - Block editor configuration
- `functions.php` - Theme functionality and hooks
- `README.md` - Complete theme documentation
- `VERIFICATION.md` - Verification checklist

### /parts/ - Template Parts (2 files)
- `header.html` - Site header
- `footer.html` - Site footer

### /templates/ - Page Templates (3 files)
- `index.html` - Homepage template
- `archive.html` - Category archive template
- `single.html` - Single post template

### /assets/css/ - Theme Stylesheets (4 files)
- `variables.css` - CSS custom properties
- `base.css` - Base styles
- `components.css` - Component styles
- `aura.css` - Aura animations

### /assets/js/ - Theme JavaScript (6 files)
- `supabase-client.js` - Supabase connection
- `main.js` - WordPress-specific entry point
- `categories.js` - Category rendering
- `posts.js` - Post display
- `aura.js` - Aura effects
- `header-logo.js` - Animated logo

### /assets/images/ - Category Icons (12 files)
Same 12 PNG files as the static site

---

## 🗄️ Database Structure

### Tables

**categories**
- id (uuid, primary key)
- name (text)
- slug (text, unique)
- description (text)
- sort_order (integer)
- icon_up (text) - filename for default state
- icon_hover (text) - filename for hover state
- created_at (timestamptz)

**posts**
- id (uuid, primary key)
- title (text)
- slug (text, unique)
- content (text)
- excerpt (text)
- category_id (uuid, foreign key → categories)
- featured_image (text)
- published (boolean)
- created_at (timestamptz)
- updated_at (timestamptz)

### Security

- ✅ Row Level Security (RLS) enabled on all tables
- ✅ Public read access for published content
- ✅ Secure write access (admin only)

---

## 🚀 Deployment Options

### Static Site (Netlify/Vercel)
1. Push to GitHub
2. Connect repository to Netlify/Vercel
3. Set environment variables from `.env`
4. Deploy automatically

### WordPress Theme
1. Extract `olon-one-tv-wp-theme.tar.gz`
2. Upload `wordpress-theme` folder to `/wp-content/themes/`
3. Add Supabase constants to `wp-config.php`
4. Activate theme in WordPress admin

---

## 🔧 Configuration

### Supabase Credentials

**Static Site** (environment variables):
```bash
VITE_SUPABASE_URL=https://irbflzzuamvvujebhter.supabase.co
VITE_SUPABASE_ANON_KEY=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...
```

**WordPress** (PHP constants in wp-config.php):
```php
define('SUPABASE_URL', 'https://irbflzzuamvvujebhter.supabase.co');
define('SUPABASE_ANON_KEY', 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9...');
```

---

## 📊 File Count Summary

| Directory | Files |
|-----------|-------|
| Root | 16 |
| /css/ | 4 |
| /js/ | 6 |
| /images/ | 12 |
| /supabase/ | 4 |
| /wordpress-theme/ | 32 |
| **Total** | **74** |

---

## 📝 Notes

- Both static site and WordPress theme share identical CSS, JavaScript, and images
- Database is already configured with all 6 sentiment categories
- Theme uses WordPress Block Theme architecture (Full Site Editing compatible)
- All code follows modern JavaScript (ES6+) and CSS best practices
- Responsive design works on all device sizes

## 📦 WordPress Theme Installation

The complete WordPress theme source is in the `wordpress-theme/` folder (32 files).

To install:
1. Download the `wordpress-theme/` folder
2. Upload to your WordPress `/wp-content/themes/` directory
3. See `WORDPRESS-THEME-INSTALL.md` for complete instructions

**Note:** Archive files cannot be stored due to platform binary file restrictions. Create your own archive locally if needed:
```bash
tar -czf olon-sentiment-theme.tar.gz wordpress-theme/
```
