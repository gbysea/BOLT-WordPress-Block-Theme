/*
  # Fix Security Issues

  This migration addresses several security and performance issues:

  ## Changes Made

  1. **Remove Redundant Indexes**
     - Drop `idx_categories_slug` (redundant with unique constraint `categories_slug_key`)
     - Drop `idx_posts_slug` (redundant with unique constraint `posts_slug_key`)
     - Drop `idx_posts_published` (unused index)
     - Drop `idx_aura_settings_key` (redundant with unique constraint `aura_settings_key_key`)

  2. **Fix Multiple Permissive Policies on aura_settings**
     - Drop overly broad policy "Authenticated users can manage aura settings"
     - Keep "Anyone can view aura settings" for SELECT
     - Add specific policies for INSERT, UPDATE, DELETE restricted to authenticated users

  3. **Fix Multiple Permissive Policies on posts**
     - Drop "Authenticated users can view all posts" (overly broad)
     - Keep "Anyone can view published posts" which properly restricts access
     - This ensures proper access control: anonymous users see only published posts

  4. **Fix Function Search Path Vulnerability**
     - Recreate `update_updated_at_column` function with explicit search_path
     - Prevents schema-based injection attacks
     - Recreate triggers after function update

  ## Security Impact
     - Removes policy conflicts that could lead to unintended access
     - Fixes function security by setting immutable search_path
     - Improves database performance by removing unused indexes
*/

-- 1. Remove redundant and unused indexes
DROP INDEX IF EXISTS idx_categories_slug;
DROP INDEX IF EXISTS idx_posts_slug;
DROP INDEX IF EXISTS idx_posts_published;
DROP INDEX IF EXISTS idx_aura_settings_key;

-- 2. Fix multiple permissive policies on aura_settings
DROP POLICY IF EXISTS "Authenticated users can manage aura settings" ON aura_settings;

-- Add specific policies for aura_settings (use DO block to check if they exist)
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_policies 
    WHERE schemaname = 'public' 
      AND tablename = 'aura_settings' 
      AND policyname = 'Authenticated users can insert aura settings'
  ) THEN
    CREATE POLICY "Authenticated users can insert aura settings"
      ON aura_settings
      FOR INSERT
      TO authenticated
      WITH CHECK (true);
  END IF;

  IF NOT EXISTS (
    SELECT 1 FROM pg_policies 
    WHERE schemaname = 'public' 
      AND tablename = 'aura_settings' 
      AND policyname = 'Authenticated users can update aura settings'
  ) THEN
    CREATE POLICY "Authenticated users can update aura settings"
      ON aura_settings
      FOR UPDATE
      TO authenticated
      USING (true)
      WITH CHECK (true);
  END IF;

  IF NOT EXISTS (
    SELECT 1 FROM pg_policies 
    WHERE schemaname = 'public' 
      AND tablename = 'aura_settings' 
      AND policyname = 'Authenticated users can delete aura settings'
  ) THEN
    CREATE POLICY "Authenticated users can delete aura settings"
      ON aura_settings
      FOR DELETE
      TO authenticated
      USING (true);
  END IF;
END $$;

-- 3. Fix multiple permissive policies on posts
DROP POLICY IF EXISTS "Authenticated users can view all posts" ON posts;

-- 4. Fix function search path vulnerability
-- Drop triggers first, then function, then recreate both
DROP TRIGGER IF EXISTS update_posts_updated_at ON posts;
DROP TRIGGER IF EXISTS update_aura_settings_updated_at ON aura_settings;
DROP FUNCTION IF EXISTS update_updated_at_column();

-- Recreate function with secure search_path
CREATE OR REPLACE FUNCTION update_updated_at_column()
RETURNS trigger
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
BEGIN
  NEW.updated_at = now();
  RETURN NEW;
END;
$$;

-- Recreate triggers
CREATE TRIGGER update_posts_updated_at
  BEFORE UPDATE ON posts
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at_column();

CREATE TRIGGER update_aura_settings_updated_at
  BEFORE UPDATE ON aura_settings
  FOR EACH ROW
  EXECUTE FUNCTION update_updated_at_column();
