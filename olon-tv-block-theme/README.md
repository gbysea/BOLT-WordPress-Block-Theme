# OLON Sentiment TV - WordPress Block Theme

A sentiment-driven content experience powered by Supabase. Explore content across six quantum sentiment dimensions with dynamic aura visualization.

**✨ UPDATED: Testing sync functionality** - This line added to test the sync script!

## Features

- ✅ **6 Sentiment Categories**: Top, Up, Charm, Bottom, Down, Strange (quantum-inspired)
- ✅ **Dynamic Aura System**: Real-time color transitions based on category sentiment
- ✅ **Supabase Integration**: Real-time data fetching and content management
- ✅ **WordPress Block Theme**: Full Site Editing (FSE) compatible
- ✅ **Responsive Design**: Mobile-first, works on all devices
- ✅ **Modern JavaScript**: Modular ES6 architecture
- ✅ **Custom Permalinks**: Clean URLs (`/category/top`, `/post/my-post`)

## Requirements

- **WordPress**: 6.0 or higher
- **PHP**: 7.4 or higher
- **Supabase Account**: Free tier works perfectly
- **Modern Browser**: Chrome, Firefox, Safari, Edge (latest versions)

## Installation

### Step 1: Upload Theme

1. Download or clone this repository
2. Upload the `wordpress-theme` folder to `/wp-content/themes/`
3. Rename to `olon-sentiment-tv` (optional but recommended)

### Step 2: Configure Supabase

Add these constants to your `wp-config.php` file **before** the line that says `/* That's all, stop editing! */`:

```php
/**
 * Supabase Configuration for OLON Sentiment TV
 */
define('SUPABASE_URL', 'https://your-project-id.supabase.co');
define('SUPABASE_ANON_KEY', 'your-anon-key-here');
```

**Get your credentials:**
1. Go to https://supabase.com/dashboard
2. Select your project
3. Navigate to Settings → API
4. Copy your Project URL and anon/public key

### Step 3: Set Up Database

Run these SQL migrations in your Supabase SQL Editor:

**Migration 1: Create Tables**
```sql
-- Create categories table
CREATE TABLE IF NOT EXISTS categories (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text NOT NULL,
  slug text UNIQUE NOT NULL,
  description text,
  sort_order integer DEFAULT 0,
  icon_up text,
  icon_hover text,
  created_at timestamptz DEFAULT now()
);

-- Create posts table
CREATE TABLE IF NOT EXISTS posts (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  title text NOT NULL,
  slug text UNIQUE NOT NULL,
  content text,
  excerpt text,
  category_id uuid REFERENCES categories(id),
  featured_image text,
  published boolean DEFAULT false,
  created_at timestamptz DEFAULT now(),
  updated_at timestamptz DEFAULT now()
);

-- Enable RLS
ALTER TABLE categories ENABLE ROW LEVEL SECURITY;
ALTER TABLE posts ENABLE ROW LEVEL SECURITY;

-- Public read access
CREATE POLICY "Public can read categories"
  ON categories FOR SELECT
  USING (true);

CREATE POLICY "Public can read published posts"
  ON posts FOR SELECT
  USING (published = true);
```

**Migration 2: Populate Categories**
```sql
INSERT INTO categories (name, slug, description, sort_order, icon_up, icon_hover) VALUES
('Top', 'top', 'Premium excellence and outstanding quality', 1, 'top-UP-olon-120.png', 'top-HOVER-olon-120.png'),
('Up', 'up', 'Uplifting, positive, and encouraging content', 2, 'up-UP-olon-120.png', 'up-HOVER-olon-120.png'),
('Charm', 'charm', 'Delightful and captivating experiences', 3, 'charm-UP-olon-120.png', 'charm-HOVER-olon-120.png'),
('Bottom', 'bottom', 'Fundamental and foundational topics', 4, 'bottom-UP-olon-120.png', 'bottom-HOVER-olon-120.png'),
('Down', 'down', 'Serious and sobering perspectives', 5, 'down-UP-olon-120.png', 'down-HOVER-olon-120.png'),
('Strange', 'strange', 'Unusual and thought-provoking content', 6, 'strange-UP-olon-120.png', 'strange-HOVER-olon-120.png')
ON CONFLICT (slug) DO NOTHING;
```

### Step 4: Activate Theme

1. Log in to WordPress admin
2. Go to Appearance → Themes
3. Activate "OLON Sentiment TV"
4. Visit your site homepage

## Usage

### Creating Content

Content is managed directly in Supabase:

1. Go to your Supabase dashboard
2. Open Table Editor
3. Select the `posts` table
4. Click "Insert row" to add content

**Example Post:**
```json
{
  "title": "My First Post",
  "slug": "my-first-post",
  "content": "<p>This is the post content with <strong>HTML</strong> support.</p>",
  "excerpt": "A brief description of the post",
  "category_id": "[select from categories table]",
  "published": true
}
```

### URL Structure

- **Homepage**: `/`
- **Category Archive**: `/category/{slug}` (e.g., `/category/top`)
- **Single Post**: `/post/{slug}` (e.g., `/post/my-first-post`)

### Customization

**Theme Colors** - Edit `theme.json`:
```json
"color": {
  "palette": [
    {"name": "Top Quark", "slug": "top", "color": "#FFD700"}
  ]
}
```

**Aura Effects** - Edit `assets/css/aura.css`

**Category Icons** - Replace PNG files in `assets/images/`

## File Structure

```
wordpress-theme/
├── style.css              # Theme metadata
├── theme.json             # Block editor config
├── functions.php          # Theme functionality
├── README.md              # This file
├── assets/
│   ├── css/
│   │   ├── variables.css  # CSS custom properties
│   │   ├── base.css       # Base styles
│   │   ├── components.css # Component styles
│   │   └── aura.css       # Aura animations
│   ├── js/
│   │   ├── supabase-client.js  # Supabase connection
│   │   ├── main.js             # WordPress entry point
│   │   ├── posts.js            # Post rendering
│   │   ├── categories.js       # Category rendering
│   │   ├── aura.js             # Aura effects
│   │   └── header-logo.js      # Dynamic logo
│   └── images/
│       └── [quark icons]  # 12 PNG files (UP/HOVER states)
├── templates/
│   ├── index.html         # Homepage
│   ├── archive.html       # Category archive
│   └── single.html        # Single post
└── parts/
    ├── header.html        # Header template part
    └── footer.html        # Footer template part
```

## Troubleshooting

### "No categories found"

- Check Supabase credentials in `wp-config.php`
- Verify categories table has data
- Check browser console for errors

### Aura not showing

- Ensure JavaScript is enabled
- Check for console errors
- Verify `main.js` is loaded

### Images not loading

- Check file paths in Supabase
- Verify PNG files exist in `assets/images/`
- Check browser Network tab

### Blank page

- Enable WordPress debug mode in `wp-config.php`:
  ```php
  define('WP_DEBUG', true);
  define('WP_DEBUG_LOG', true);
  ```
- Check `wp-content/debug.log` for errors

## Development

### Local Development

```bash
# Serve locally (static version)
npm run dev

# Or use WordPress with Local, XAMPP, or MAMP
```

### Adding Features

1. Edit JavaScript modules in `assets/js/`
2. Update styles in `assets/css/`
3. Modify templates in `templates/` or `parts/`
4. Increment version in `style.css` and `functions.php`

## Support

- **Issues**: Open an issue on GitHub
- **Documentation**: See inline code comments
- **Supabase Docs**: https://supabase.com/docs

## License

MIT License - Use freely in personal and commercial projects.

## Credits

- **Built with**: WordPress, Supabase, JavaScript
- **Inspired by**: Quantum physics sentiment mapping
- **Design**: Modern minimalist aesthetic

---

**Made with sentiment** ❤️
