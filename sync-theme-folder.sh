#!/bin/bash

# Sync olon-tv-block-theme folder with olon-tv-block-theme branch
# This script mimics 'git subtree pull' functionality

echo "🔄 Syncing olon-tv-block-theme folder from branch..."

# Ensure we're on main branch
git checkout main

# Remove existing folder
echo "📁 Removing existing olon-tv-block-theme folder..."
git rm -r olon-tv-block-theme/ 2>/dev/null || rm -rf olon-tv-block-theme/

# Pull latest from olon-tv-block-theme branch
echo "⬇️  Pulling latest from olon-tv-block-theme branch..."
git read-tree --prefix=olon-tv-block-theme/ -u olon-tv-block-theme

# Stage changes
echo "📝 Staging changes..."
git add olon-tv-block-theme/

# Commit the update
echo "💾 Committing sync..."
git commit -m "Sync olon-tv-block-theme folder from branch

- Updated folder contents from olon-tv-block-theme branch
- Maintains consistency between branch and main folder"

echo "✅ Sync complete! olon-tv-block-theme folder updated."
echo "🚀 Run 'git push origin main' to push changes to remote."