# GitHub Branch Ruleset Configuration Guide

This guide shows exactly how to configure the branch ruleset for the BOLT WordPress Block Theme repository.

## 🛡️ Branch Ruleset Settings

### Basic Information
| Field | Value |
|-------|-------|
| **Ruleset Name** | `Main Branch Protection` |
| **Enforcement Status** | ✅ Active |
| **Target** | Branch |

### Target Branches
| Setting | Configuration |
|---------|---------------|
| **Include by pattern** | `main` |
| **Bypass list** | Leave empty or add `@gbysea` |

## 🔒 Protection Rules Configuration

### 1. Restrict Pushes
```
✅ Restrict pushes that create files larger than 100 MB
```
**Why**: Prevents large binary files from bloating the repository

### 2. Restrict Force Pushes  
```
✅ Restrict force pushes
```
**Why**: Protects git history from being rewritten accidentally

### 3. Restrict Deletions
```
✅ Restrict deletions
```
**Why**: Prevents accidental deletion of the main branch

### 4. Required Linear History
```
✅ Require linear history
```
**Why**: Keeps a clean, readable git history
**Alternative**: Leave unchecked if you prefer merge commits

### 5. Required Status Checks
```
✅ Require status checks to pass before merging
✅ Require branches to be up to date before merging

Required Checks:
- code-quality
- security-scan  
- deployment-ready
```
**Note**: Add these checks after the first workflow runs

### 6. Required Pull Requests
```
✅ Require a pull request before merging
Required reviewers: 1
✅ Dismiss stale pull request approvals when new commits are pushed
✅ Require review from code owners
✅ Require approval of the most recent reviewable push  
✅ Require conversation resolution before merging
```

### 7. Administrator Enforcement
```
Choose one:
Option A (Strict): ✅ Include administrators in restrictions
Option B (Flexible): ❌ Allow administrators to bypass
```
**Recommendation**: Choose Option A for team projects, Option B if you're solo

## 📋 Complete Configuration Checklist

### Phase 1: Initial Setup
- [ ] Navigate to repository Settings → Rules
- [ ] Click "New ruleset" 
- [ ] Set ruleset name: "Main Branch Protection"
- [ ] Set enforcement status: Active
- [ ] Set target pattern: `main`
- [ ] Configure basic restrictions (deletions, force pushes, large files)
- [ ] Set up pull request requirements
- [ ] Save the ruleset

### Phase 2: After First Workflow Run
- [ ] Edit the ruleset
- [ ] Add required status checks:
  - [ ] `code-quality`
  - [ ] `security-scan` 
  - [ ] `deployment-ready`
- [ ] Save changes

### Phase 3: Advanced Configuration (Optional)
- [ ] Add CODEOWNERS file (already created)
- [ ] Set up signed commits (if needed)
- [ ] Configure deployment environments (if needed)

## 🎯 Expected Behavior After Setup

### ✅ What Will Be Required:
1. **All changes** must go through pull requests
2. **Automated checks** must pass before merging
3. **Code review** from at least 1 person required
4. **Conversations** must be resolved before merging
5. **No force pushes** or deletions allowed

### ✅ What Will Be Prevented:
- Direct pushes to main branch
- Merging with failing checks
- Large file commits (>100MB)
- Unreviewed changes
- Force pushes that rewrite history

## 🚀 Testing the Configuration

After setup, test with this workflow:
1. Create a new branch: `git checkout -b test-protection`
2. Make a small change
3. Commit and push the branch
4. Create a pull request
5. Verify all checks run and protection works

## 🛠️ Troubleshooting

### Status Checks Not Available Yet?
- The checks will appear after the workflow runs at least once
- Create a test PR to trigger the workflow
- Then add the checks to the ruleset

### Need to Bypass Protection Temporarily?
- Add your username to the bypass list
- Make necessary changes
- Remove from bypass list immediately after

### Administrator Override Needed?
- Consider if you really need to bypass
- Document the reason for any bypasses
- Re-enable protection as soon as possible

## 🔗 Related Files

- [Branch Protection Workflow](../workflows/branch-protection-checks.yml)
- [CODEOWNERS](../CODEOWNERS)
- [Contributing Guidelines](../../CONTRIBUTING.md)

---

**Remember**: These settings protect your code quality and project integrity. They prevent accidents while maintaining a smooth development workflow! 🛡️