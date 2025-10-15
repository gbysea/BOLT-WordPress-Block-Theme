/*
  # Add OLON Category Fields from CSV

  1. Schema Changes
    - Add new columns to `categories` table to match CSV structure:
      - `min_score` (numeric) - Minimum score for category (0-100)
      - `max_score` (numeric) - Maximum score for category (0-100)
      - `min_valence` (numeric) - Minimum valence for category (0-1)
      - `max_valence` (numeric) - Maximum valence for category (0-1)
      - `color_hex` (text) - Hex color code for category
      - `mode` (text) - Category mode (on/no)
      - `direction` (text) - Category direction (deosil/widdershins)
      - `spotify_playlist_id` (text) - Spotify playlist ID
      - `youtube_playlist_id` (text) - YouTube playlist ID
      - `csv_id` (integer) - Original CSV ID for reference
  
  2. Notes
    - All new columns are nullable to allow safe migration
    - Existing data is preserved
    - CSV data will be populated in next migration step
*/

-- Add CSV ID column for reference
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'categories' AND column_name = 'csv_id'
  ) THEN
    ALTER TABLE categories ADD COLUMN csv_id integer UNIQUE;
  END IF;
END $$;

-- Add score range columns
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'categories' AND column_name = 'min_score'
  ) THEN
    ALTER TABLE categories ADD COLUMN min_score numeric CHECK (min_score >= 0 AND min_score <= 100);
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'categories' AND column_name = 'max_score'
  ) THEN
    ALTER TABLE categories ADD COLUMN max_score numeric CHECK (max_score >= 0 AND max_score <= 100);
  END IF;
END $$;

-- Add valence range columns
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'categories' AND column_name = 'min_valence'
  ) THEN
    ALTER TABLE categories ADD COLUMN min_valence numeric CHECK (min_valence >= 0 AND min_valence <= 1);
  END IF;
END $$;

DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'categories' AND column_name = 'max_valence'
  ) THEN
    ALTER TABLE categories ADD COLUMN max_valence numeric CHECK (max_valence >= 0 AND max_valence <= 1);
  END IF;
END $$;

-- Add color hex column
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'categories' AND column_name = 'color_hex'
  ) THEN
    ALTER TABLE categories ADD COLUMN color_hex text;
  END IF;
END $$;

-- Add mode column
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'categories' AND column_name = 'mode'
  ) THEN
    ALTER TABLE categories ADD COLUMN mode text;
  END IF;
END $$;

-- Add direction column
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'categories' AND column_name = 'direction'
  ) THEN
    ALTER TABLE categories ADD COLUMN direction text;
  END IF;
END $$;

-- Add Spotify playlist ID column
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'categories' AND column_name = 'spotify_playlist_id'
  ) THEN
    ALTER TABLE categories ADD COLUMN spotify_playlist_id text;
  END IF;
END $$;

-- Add YouTube playlist ID column
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns
    WHERE table_name = 'categories' AND column_name = 'youtube_playlist_id'
  ) THEN
    ALTER TABLE categories ADD COLUMN youtube_playlist_id text;
  END IF;
END $$;