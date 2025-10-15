#!/bin/bash
#
# Create WordPress Theme Archive
#
# This script creates a tar.gz archive of the WordPress theme.
# Run this in your LOCAL terminal where you have the project files.
#

set -e

echo "Creating WordPress theme archive..."

# Check if wordpress-theme directory exists
if [ ! -d "wordpress-theme" ]; then
    echo "Error: wordpress-theme directory not found!"
    echo "Make sure you run this script from the project root directory."
    exit 1
fi

# Create the archive
tar -czf olon-sentiment-theme.tar.gz wordpress-theme/

# Verify the archive was created
if [ -f "olon-sentiment-theme.tar.gz" ]; then
    echo "✓ Archive created successfully!"
    echo ""
    echo "File: olon-sentiment-theme.tar.gz"
    echo "Size: $(du -h olon-sentiment-theme.tar.gz | cut -f1)"
    echo ""
    echo "Archive contains:"
    tar -tzf olon-sentiment-theme.tar.gz | wc -l | xargs echo "  - files/folders"
    echo ""
    echo "Next steps:"
    echo "1. Upload to WordPress: Appearance → Themes → Add New → Upload Theme"
    echo "2. Or upload the 'wordpress-theme' folder to /wp-content/themes/"
    echo "3. See WORDPRESS-THEME-INSTALL.md for configuration details"
else
    echo "Error: Failed to create archive"
    exit 1
fi
