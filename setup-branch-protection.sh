#!/bin/bash

# Branch Protection Setup Helper
# This script provides guidance for setting up branch protection

echo "🛡️  BOLT WordPress Block Theme - Branch Protection Setup"
echo "======================================================="
echo ""

echo "📋 Follow these steps to protect your main branch:"
echo ""

echo "1️⃣  Go to GitHub repository settings:"
echo "   https://github.com/gbysea/BOLT-WordPress-Block-Theme/settings"
echo ""

echo "2️⃣  Click 'Branches' in the left sidebar"
echo ""

echo "3️⃣  Click 'Add rule' or 'Add branch protection rule'"
echo ""

echo "4️⃣  Configure the following settings:"
echo "   📝 Branch name pattern: main"
echo "   ✅ Require a pull request before merging"
echo "   ✅ Required number of reviewers: 1"
echo "   ✅ Dismiss stale PR approvals when new commits are pushed"
echo "   ✅ Require status checks to pass before merging"
echo "   ✅ Require branches to be up to date before merging"
echo "   ✅ Require conversation resolution before merging"
echo "   ✅ Restrict pushes that create files larger than 100 MB"
echo "   ❌ Allow force pushes: (leave unchecked)"
echo "   ❌ Allow deletions: (leave unchecked)"
echo ""

echo "5️⃣  Add required status checks:"
echo "   After the first PR runs, you can add these checks:"
echo "   - code-quality"
echo "   - security-scan"
echo "   - deployment-ready"
echo ""

echo "6️⃣  Save the rule by clicking 'Create'"
echo ""

echo "✅ Branch protection files created:"
echo "   - .github/workflows/branch-protection-checks.yml"
echo "   - .github/BRANCH_PROTECTION.md"
echo ""

echo "🚀 Next steps:"
echo "   1. Commit and push these files"
echo "   2. Set up branch protection in GitHub UI"
echo "   3. Test with a sample pull request"
echo ""

echo "💡 Need help? Check the documentation:"
echo "   - .github/BRANCH_PROTECTION.md"
echo "   - CONTRIBUTING.md"
echo ""

echo "🎉 Your main branch will be protected once configured!"