# Setup Instructions for GitHub Codespace

## Step 1: In your Codespace terminal, run these commands:

```bash
# Create directory structure
mkdir -p css js images supabase/migrations

# Initialize git
git init
git branch -m main
git remote add origin https://github.com/gbysea/olon-one-tv.git
```

## Step 2: Copy all files from this project

You need to copy all files from the current working project. The easiest way is to:

1. Use the file explorer in your Codespace
2. Create each file manually by copying content from here
3. Or use the GitHub web interface to upload files directly

## Step 3: After all files are copied, commit and push:

```bash
git add .
git commit -m "Initial commit: OLON Sentiment TV"
git push -u origin main
```

## Alternative: Upload via GitHub Web Interface

1. Go to https://github.com/gbysea/olon-one-tv
2. Click "uploading an existing file"
3. Drag and drop all project files
4. Commit directly to main branch
