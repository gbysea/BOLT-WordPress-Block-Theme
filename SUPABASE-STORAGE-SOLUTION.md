# Supabase Storage Solution for Images

## Why This Solves Your Problem

✅ Images stored in Supabase = PERMANENT  
✅ No more dummy file replacements  
✅ Fast CDN delivery  
✅ Same images work for static site AND WordPress  
✅ Upload ONCE, use EVERYWHERE  

## Setup Steps

### 1. Create Storage Bucket (One-time)

```sql
-- Run in Supabase SQL Editor
insert into storage.buckets (id, name, public)
values ('olon-images', 'olon-images', true);
```

### 2. Set Storage Policy (One-time)

```sql
-- Allow public read access
create policy "Public Access"
on storage.objects for select
using ( bucket_id = 'olon-images' );

-- Allow authenticated uploads (optional - for admin)
create policy "Authenticated uploads"
on storage.objects for insert
with check ( bucket_id = 'olon-images' AND auth.role() = 'authenticated' );
```

### 3. Upload Your Images

Via Supabase Dashboard:
1. Go to Storage
2. Create bucket: `olon-images`
3. Upload your 12 PNG files

OR via code:
```javascript
const { data, error } = await supabase
  .storage
  .from('olon-images')
  .upload('top-UP-olon-120.png', file)
```

### 4. Get Public URLs

Your images will be at:
```
https://[project-ref].supabase.co/storage/v1/object/public/olon-images/top-UP-olon-120.png
```

### 5. Update Database

```sql
-- Update category icon paths
UPDATE categories SET
  icon_up = 'https://[your-project].supabase.co/storage/v1/object/public/olon-images/top-UP-olon-120.png',
  icon_hover = 'https://[your-project].supabase.co/storage/v1/object/public/olon-images/top-HOVER-olon-120.png'
WHERE slug = 'top';

-- Repeat for all categories...
```

## Result

✅ Images load from Supabase CDN  
✅ NEVER disappear  
✅ Works in static site  
✅ Works in WordPress theme  
✅ Fast global delivery  
✅ No more uploading to Bolt!  

