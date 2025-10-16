# Branch Protection Configuration

This document outlines the branch protection settings for the BOLT WordPress Block Theme repository.

## 🛡️ Protected Branches

### Main Branch (`main`)

**Protection Rules Applied:**
- ✅ Require a pull request before merging
- ✅ Require approvals: 1
- ✅ Dismiss stale PR approvals when new commits are pushed
- ✅ Require status checks to pass before merging
- ✅ Require branches to be up to date before merging
- ✅ Require conversation resolution before merging
- ✅ Restrict pushes that create files larger than 100 MB
- ✅ Include administrators (recommended for team projects)

## 🔧 Required Status Checks

The following automated checks must pass before merging:

### 1. Code Quality Checks (`code-quality`)
- **Large file detection** (>10MB)
- **WordPress theme structure validation**
- **CSS syntax checking**
- **JSON validation**

### 2. Security Scan (`security-scan`) 
- **Sensitive file detection**
- **Hardcoded secret scanning**
- **Security pattern analysis**

### 3. Accessibility Check (`accessibility-check`)
- **HTML template accessibility**
- **Alt text validation**
- **Heading structure check**

### 4. Deployment Readiness (`deployment-ready`)
- **Theme completeness verification**
- **Version checking**
- **Documentation validation**

## 🚀 Workflow for Contributors

### For External Contributors:
1. **Fork** the repository
2. **Create feature branch** from main
3. **Make changes** on feature branch
4. **Submit pull request** to main branch
5. **Wait for review** and status checks
6. **Address feedback** if needed
7. **Merge** after approval and passing checks

### For Maintainers:
1. **Create branch** from main for features
2. **Work on branch** (no direct pushes to main)
3. **Submit PR** even as maintainer
4. **Ensure all checks pass**
5. **Merge after review**

## ⚠️ Emergency Procedures

### If Branch Protection Needs Bypass:
1. **Document reason** for bypass
2. **Get additional approval** from project owner
3. **Temporarily disable protection** if absolutely necessary
4. **Re-enable protection** immediately after
5. **Review changes** made during bypass

### Hot Fixes:
1. **Create hotfix branch** from main
2. **Make minimal changes** only
3. **Fast-track PR review**
4. **Merge and tag release**

## 📋 Checklist for Setting Up Branch Protection

When configuring branch protection in GitHub Settings > Branches:

- [ ] Branch name pattern: `main`
- [ ] Require a pull request before merging
  - [ ] Required number of reviewers: 1
  - [ ] Dismiss stale PR approvals when new commits are pushed
  - [ ] Require review from code owners (if CODEOWNERS file exists)
- [ ] Require status checks to pass before merging
  - [ ] Require branches to be up to date before merging
  - [ ] Status checks to require:
    - [ ] `code-quality`
    - [ ] `security-scan` 
    - [ ] `deployment-ready`
- [ ] Require conversation resolution before merging
- [ ] Require signed commits (optional, for high security)
- [ ] Require linear history (optional, keeps clean history)
- [ ] Include administrators (recommended unless solo project)
- [ ] Restrict pushes that create files larger than 100 MB
- [ ] Allow force pushes: ❌ (disabled)
- [ ] Allow deletions: ❌ (disabled)

## 🎯 Benefits

### Security Benefits:
- **Prevents accidental force pushes** that could rewrite history
- **Ensures code review** for all changes
- **Automated security scanning** before merge
- **Protects against sensitive data** commits

### Quality Benefits:
- **Automated testing** ensures code quality
- **Consistent review process** maintains standards
- **Prevents broken builds** from reaching main
- **Documentation requirements** keep project maintainable

### Collaboration Benefits:
- **Clear contribution workflow** for new contributors
- **Discussion and feedback** through PR process
- **Knowledge sharing** through code reviews
- **Audit trail** of all changes

## 🔗 Related Files

- [Contributing Guidelines](../CONTRIBUTING.md)
- [Issue Templates](../ISSUE_TEMPLATE/)
- [Pull Request Template](../pull_request_template.md)
- [Branch Protection Workflow](../workflows/branch-protection-checks.yml)

---

**Remember**: Branch protection is about preventing accidents, not blocking progress. It ensures quality and security while maintaining a smooth development workflow. 🚀