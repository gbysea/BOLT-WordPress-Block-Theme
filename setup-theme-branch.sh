#!/bin/bash

echo "🚀 Setting up olon-tv-block-theme branch..."
echo ""

# Check if we're in a git repository
if ! git rev-parse --git-dir > /dev/null 2>&1; then
    echo "❌ Error: Not a git repository. Please run this script from your git repository root."
    exit 1
fi

# Check if branch exists
if ! git rev-parse --verify olon-tv-block-theme > /dev/null 2>&1; then
    echo "❌ Error: Branch 'olon-tv-block-theme' doesn't exist."
    echo "Please create it first in GitHub or run: git checkout -b olon-tv-block-theme"
    exit 1
fi

# Switch to the branch
echo "📦 Switching to olon-tv-block-theme branch..."
git checkout olon-tv-block-theme

# Check if wordpress-theme folder exists
if [ ! -d "wordpress-theme" ]; then
    echo "❌ Error: wordpress-theme folder not found."
    exit 1
fi

echo "🧹 Cleaning branch (removing non-theme files)..."

# Remove all files except wordpress-theme folder
git rm -r .env functions.php README.md style.css theme.json VERIFICATION.md parts/ templates/ assets/ 2>/dev/null || true

echo "📝 Renaming wordpress-theme to olon-tv-block-theme..."

# Rename the folder
mv wordpress-theme olon-tv-block-theme

# Stage the renamed folder
git add olon-tv-block-theme/

# Commit the changes
echo "💾 Committing changes..."
git commit -m "Clean branch: WordPress theme only in olon-tv-block-theme folder"

echo "🔄 Moving theme files to root..."

# Move everything to root
mv olon-tv-block-theme/* .
mv olon-tv-block-theme/.* . 2>/dev/null || true
rmdir olon-tv-block-theme

# Stage all changes
git add .

# Commit
git commit -m "Move theme files to root for clean deployment"

echo "☁️  Pushing to GitHub..."
git push origin olon-tv-block-theme

echo ""
echo "✅ Done! Your olon-tv-block-theme branch is ready."
echo ""
echo "📋 Next steps:"
echo "1. Go to WordPress Admin → Deployer for Git"
echo "2. Set Branch: olon-tv-block-theme"
echo "3. Set Deploy path: /wp-content/themes/olon-tv-block-theme/"
echo "4. Save and deploy!"
echo ""
