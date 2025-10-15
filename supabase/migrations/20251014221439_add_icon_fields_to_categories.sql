/*
  # Add Icon Fields to Categories

  1. Schema Changes
    - Add `icon_up` (text) - URL to default/up state icon image
    - Add `icon_hover` (text) - URL to hover state icon image
    - Add `post_count` (integer) - Number of published posts in category

  2. Data Population
    - Set icon URLs for all 6 OLON categories
    - Initialize post_count to 0

  3. Notes
    - Icons reference the quark images in /images/ directory
    - post_count should be updated when posts are added/removed
*/

-- Add icon_up column
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'categories' AND column_name = 'icon_up'
  ) THEN
    ALTER TABLE categories ADD COLUMN icon_up text;
  END IF;
END $$;

-- Add icon_hover column
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'categories' AND column_name = 'icon_hover'
  ) THEN
    ALTER TABLE categories ADD COLUMN icon_hover text;
  END IF;
END $$;

-- Add post_count column
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'categories' AND column_name = 'post_count'
  ) THEN
    ALTER TABLE categories ADD COLUMN post_count integer DEFAULT 0;
  END IF;
END $$;

-- Update TOP category icons
UPDATE categories
SET 
  icon_up = '/images/top-UP-olon-120.png',
  icon_hover = '/images/top-HOVER-olon-120.png',
  post_count = 0
WHERE slug = 'top';

-- Update UP category icons
UPDATE categories
SET 
  icon_up = '/images/up-UP-olon-120.png',
  icon_hover = '/images/up-HOVER-olon-120.png',
  post_count = 0
WHERE slug = 'up';

-- Update CHARM category icons
UPDATE categories
SET 
  icon_up = '/images/charm-UP-olon-120.png',
  icon_hover = '/images/charm-HOVER-olon-120.png',
  post_count = 0
WHERE slug = 'charm';

-- Update BOTTOM category icons
UPDATE categories
SET 
  icon_up = '/images/bottom-UP-olon-120.png',
  icon_hover = '/images/bottom-HOVER-olon-120.png',
  post_count = 0
WHERE slug = 'bottom';

-- Update DOWN category icons
UPDATE categories
SET 
  icon_up = '/images/down-UP-olon-120.png',
  icon_hover = '/images/down-HOVER-olon-120.png',
  post_count = 0
WHERE slug = 'down';

-- Update STRANGE category icons
UPDATE categories
SET 
  icon_up = '/images/strange-UP-olon-120.png',
  icon_hover = '/images/strange-HOVER-olon-120.png',
  post_count = 0
WHERE slug = 'strange';