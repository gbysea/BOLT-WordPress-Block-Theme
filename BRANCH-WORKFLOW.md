# Branch Workflow Guide

## Repository Structure

This repository has **3 connected branches**, each serving a specific purpose:

### 1. `main` Branch - Full Development Project
**Purpose:** Master branch containing the complete project with all files

**Contents:**
- Static website files (index.html, category.html, post.html)
- Root-level folders: css/, js/, images/
- Documentation files (*.md)
- Deployment scripts and configuration
- Supabase migrations folder
- **Theme subdirectories:**
  - `olon-tv-block-theme/` - WordPress theme folder
  - `wordpress-theme/` - Alternative theme folder

**When to use:**
- Full project development
- Managing documentation
- Configuring deployment
- Working with Supabase
- Updating the static site

---

### 2. `olon-tv-block-theme` Branch - Clean WordPress Theme
**Purpose:** Isolated WordPress theme ready for distribution and installation

**Contents:**
- style.css, functions.php, theme.json (WordPress required files)
- assets/ (css, js, images)
- parts/ (header.html, footer.html)
- templates/ (index.html, archive.html, single.html)
- README.md
- .env (Supabase connection - not committed)

**When to use:**
- Developing the WordPress theme in isolation
- Testing theme functionality
- Creating distribution packages
- Installing directly in WordPress

---

### 3. `olon-wordpress-block-theme` Branch - Alternative Clean Theme
**Purpose:** Similar to olon-tv-block-theme with additional verification files

**Contents:**
- Same as olon-tv-block-theme +
- VERIFICATION.md
- setup-theme-branch.sh

**When to use:**
- Alternative theme development path
- Theme verification and testing

---

## Workflow: Making Changes

### Scenario 1: Working on the Theme in Isolation
```bash
# Switch to theme branch
git checkout olon-tv-block-theme

# Make your changes to theme files
# Edit functions.php, style.css, templates/, etc.

# Test locally with WordPress
# No extra files to distract you - just pure theme files

# Commit changes
git add .
git commit -m "Update theme functionality"
git push origin olon-tv-block-theme
```

### Scenario 2: Working on Full Project
```bash
# Switch to main branch
git checkout main

# You now see ALL project files
# Make changes to olon-tv-block-theme/ folder

# Sync changes to theme branch
git checkout olon-tv-block-theme
git checkout main -- olon-tv-block-theme/
mv olon-tv-block-theme/* .
rmdir olon-tv-block-theme

# Commit synced changes
git add .
git commit -m "Sync from main branch"
git push origin olon-tv-block-theme
```

### Scenario 3: Syncing Theme Changes Back to Main
```bash
# Start on theme branch with changes
git checkout olon-tv-block-theme
git add .
git commit -m "Theme improvements"

# Switch to main and update theme folder
git checkout main
rm -rf olon-tv-block-theme/*
git checkout olon-tv-block-theme -- .
mkdir -p olon-tv-block-theme
mv assets functions.php parts style.css templates theme.json README.md olon-tv-block-theme/

# Commit to main
git add olon-tv-block-theme/
git commit -m "Update theme from olon-tv-block-theme branch"
git push origin main
```

---

## Current Setup

**Active Branch:** `olon-tv-block-theme`

**File Structure:**
```
project/
├── .env (Supabase config - ignored by git)
├── .gitignore
├── README.md
├── functions.php
├── package-lock.json
├── style.css
├── theme.json
├── assets/
│   ├── css/ (4 files)
│   ├── js/ (6 files)
│   └── images/ (12 PNG files)
├── parts/
│   ├── header.html
│   └── footer.html
└── templates/
    ├── index.html
    ├── archive.html
    └── single.html
```

**Total:** 33 files (32 tracked + 1 .env)

---

## Quick Commands

**Switch branches:**
```bash
git checkout main                      # Full project
git checkout olon-tv-block-theme       # Clean theme
git checkout olon-wordpress-block-theme # Alternative theme
```

**View all branches:**
```bash
git branch -a
```

**See what's different:**
```bash
git diff main olon-tv-block-theme
```

---

## Best Practices

1. **Keep theme branches clean** - Only WordPress theme files, no project clutter
2. **Develop on appropriate branch** - Use theme branch for theme work, main for full project
3. **Sync regularly** - Keep branches in sync to avoid conflicts
4. **Test before pushing** - Verify theme works in WordPress before pushing
5. **.env is local** - Never commit .env file, it's in .gitignore
6. **Document changes** - Clear commit messages help track what changed where

---

## Connection Status

✅ All branches are properly connected to GitHub repository:
- Remote: https://github.com/gbysea/BOLT-WordPress-Block-Theme.git
- Local branches tracking remote branches
- Changes can be pushed/pulled from any branch
