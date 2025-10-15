#!/bin/bash
#
# WordPress Theme Download Helper
#
# INSTRUCTIONS:
# 1. Copy this entire script
# 2. Paste into YOUR terminal (bash)
# 3. It will create olon-sentiment-theme.tar.gz
#

# Check if wordpress-theme directory exists
if [ ! -d "wordpress-theme" ]; then
    echo "❌ Error: wordpress-theme directory not found!"
    echo "   Make sure you're in the project root directory."
    exit 1
fi

echo "📦 Creating WordPress theme archive..."
echo ""

# Create the archive
tar -czf olon-sentiment-theme.tar.gz wordpress-theme/

# Check if creation was successful
if [ ! -f "olon-sentiment-theme.tar.gz" ]; then
    echo "❌ Failed to create archive"
    exit 1
fi

# Get file size
SIZE=$(du -h olon-sentiment-theme.tar.gz | cut -f1)
FILES=$(tar -tzf olon-sentiment-theme.tar.gz | wc -l)

echo "✅ Archive created successfully!"
echo ""
echo "📁 File: olon-sentiment-theme.tar.gz"
echo "💾 Size: $SIZE"
echo "📄 Contains: $FILES files/folders"
echo ""
echo "Next steps:"
echo "1. Upload to WordPress: Appearance → Themes → Add New → Upload Theme"
echo "2. Or extract and upload folder to /wp-content/themes/"
echo "3. See WORDPRESS-THEME-INSTALL.md for configuration"
echo ""
echo "To verify the archive:"
echo "  tar -tzf olon-sentiment-theme.tar.gz | head -10"
