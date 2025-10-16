#!/bin/bash

# Git Hook: Auto-sync theme folder when olon-tv-block-theme branch changes
# Place this in .git/hooks/post-receive and make executable

while read oldrev newrev refname; do
    # Check if the push was to olon-tv-block-theme branch
    if [[ $refname == "refs/heads/olon-tv-block-theme" ]]; then
        echo "🔄 Auto-syncing theme folder..."
        
        # Switch to main branch
        git checkout main
        
        # Run the sync script
        ./sync-theme-folder.sh
        
        # Push the changes
        git push origin main
        
        echo "✅ Theme folder auto-synced successfully!"
    fi
done