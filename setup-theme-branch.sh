#!/bin/bash

echo "🚀 Setting up olon-tv-block-theme branch..."
echo ""

# Check if we're in a git repository
if ! git rev-parse --git-dir > /dev/null 2>&1; then
    echo "❌ Error: Not a git repository. Please run this script from your git repository root."
    exit 1
fi

# Fetch latest from remote
echo "🔄 Fetching latest changes..."
git fetch origin

# Switch to the branch
echo "📦 Switching to olon-tv-block-theme branch..."
git checkout olon-tv-block-theme
git pull origin olon-tv-block-theme

# Check if wordpress-theme folder exists
if [ ! -d "wordpress-theme" ]; then
    echo "❌ Error: wordpress-theme folder not found."
    exit 1
fi

echo "🧹 Cleaning branch (removing all non-theme files)..."

# Create a temporary directory for theme files
mkdir -p /tmp/olon-theme-backup
cp -r wordpress-theme/* /tmp/olon-theme-backup/

# Remove everything from git
git rm -rf .

# Copy theme files back to root
cp -r /tmp/olon-theme-backup/* .

# Clean up temp directory
rm -rf /tmp/olon-theme-backup

# Update style.css theme folder name
if [ -f "style.css" ]; then
    echo "📝 Updating theme name in style.css..."
    sed -i.bak 's/Text Domain: bolt-wordpress-block-theme/Text Domain: olon-tv-block-theme/g' style.css
    sed -i.bak 's/Theme Name: BOLT WordPress Block Theme/Theme Name: OLON TV Block Theme/g' style.css
    rm -f style.css.bak
fi

# Stage all changes
git add .

# Commit
echo "💾 Committing clean theme structure..."
git commit -m "Clean theme branch: Move all theme files to root"

echo "☁️  Pushing to GitHub..."
git push origin olon-tv-block-theme

echo ""
echo "✅ Done! Your olon-tv-block-theme branch is ready."
echo ""
echo "📋 Branch structure:"
echo "   Root contains: style.css, theme.json, functions.php, README.md"
echo "   + assets/, parts/, templates/ folders"
echo ""
echo "🎯 Next steps:"
echo "1. Go to WordPress Admin → Deployer for Git"
echo "2. Repository: https://github.com/gbysea/BOLT-WordPress-Block-Theme"
echo "3. Branch: olon-tv-block-theme"
echo "4. Deploy path: /wp-content/themes/olon-tv-block-theme/"
echo "5. Save and deploy!"
echo ""
