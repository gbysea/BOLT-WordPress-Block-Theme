#!/bin/bash

# Auto-sync script with branch monitoring
# Run this in the background to watch for olon-tv-block-theme changes

echo "🔍 Starting auto-sync monitor for olon-tv-block-theme branch..."
echo "Press Ctrl+C to stop monitoring"

LAST_COMMIT=""

while true; do
    # Fetch latest changes
    git fetch origin olon-tv-block-theme >/dev/null 2>&1
    
    # Get the latest commit hash from olon-tv-block-theme branch
    CURRENT_COMMIT=$(git rev-parse origin/olon-tv-block-theme)
    
    # Check if there's a new commit
    if [[ "$CURRENT_COMMIT" != "$LAST_COMMIT" ]]; then
        if [[ -n "$LAST_COMMIT" ]]; then
            echo "🔄 New changes detected in olon-tv-block-theme branch!"
            echo "📝 Latest commit: $CURRENT_COMMIT"
            
            # Switch to main branch
            git checkout main >/dev/null 2>&1
            
            # Run sync
            ./sync-theme-folder.sh
            
            # Push changes
            git push origin main
            
            echo "✅ Auto-sync completed at $(date)"
        else
            echo "📊 Initial commit hash: $CURRENT_COMMIT"
        fi
        
        LAST_COMMIT="$CURRENT_COMMIT"
    fi
    
    # Wait 30 seconds before checking again
    sleep 30
done