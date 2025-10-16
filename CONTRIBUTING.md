# Contributing to OLON WordPress Block Theme

Welcome! We're excited that you're interested in contributing to the OLON WordPress Block Theme project. This document provides guidelines and information for contributors.

## 🚀 Getting Started

### Prerequisites
- Basic knowledge of WordPress block themes
- Familiarity with HTML, CSS, JavaScript
- Understanding of Git and GitHub workflows
- WordPress 6.0+ for testing

### Development Setup
1. Fork the repository
2. Clone your fork locally
3. Create a new branch for your feature/fix
4. Set up a local WordPress development environment

## 📋 Types of Contributions

### 🟢 Good First Issues
Perfect for newcomers to the project:
- Documentation improvements
- CSS styling enhancements
- Adding new color schemes to `theme.json`
- Icon optimizations
- Translation updates
- Simple bug fixes

### 🟡 Intermediate Issues
For contributors with some experience:
- JavaScript functionality improvements
- Template part enhancements
- Performance optimizations
- Accessibility improvements
- New block patterns

### 🔴 Advanced Issues
For experienced developers:
- Core architecture changes
- Supabase integration features
- Complex JavaScript modules
- Theme performance optimization
- Security enhancements

## 🏷️ Issue Labels

We use the following labels to help contributors find suitable tasks:

- `good first issue` - Perfect for first-time contributors
- `help wanted` - We'd love community help on this
- `bug` - Something isn't working correctly
- `enhancement` - New feature or improvement
- `documentation` - Documentation needs attention
- `css/styling` - CSS and visual improvements
- `javascript` - JavaScript functionality
- `accessibility` - A11y improvements needed
- `performance` - Performance optimization
- `wordpress` - WordPress-specific functionality
- `supabase` - Database/backend integration

## 💡 How to Contribute

### 1. Find an Issue
- Browse [open issues](https://github.com/gbysea/BOLT-WordPress-Block-Theme/issues)
- Look for `good first issue` labels if you're new
- Check `help wanted` for community priorities

### 2. Get Assigned
- Comment on the issue you'd like to work on
- Wait for maintainer assignment
- Ask questions if anything is unclear

### 3. Development Workflow
```bash
# 1. Create feature branch
git checkout -b feature/your-feature-name

# 2. Make your changes
# ... develop your feature ...

# 3. Test your changes
# Test in WordPress environment

# 4. Commit with clear message
git commit -m "Add: Brief description of your change"

# 5. Push and create PR
git push origin feature/your-feature-name
```

### 4. Pull Request Guidelines
- Use a clear, descriptive title
- Reference the issue number: "Fixes #123"
- Include screenshots for UI changes
- Test on different screen sizes
- Update documentation if needed

## 🧪 Testing

### Required Tests
- [ ] Test in WordPress 6.0+
- [ ] Verify responsive design (mobile/tablet/desktop)
- [ ] Check accessibility with screen readers
- [ ] Test with different themes
- [ ] Validate HTML/CSS

### Theme Structure Testing
- [ ] Template parts load correctly
- [ ] Block patterns work as expected
- [ ] Supabase integration functions (if applicable)
- [ ] JavaScript modules load without errors

## 📝 Code Standards

### CSS Guidelines
- Use CSS custom properties (variables) defined in `assets/css/variables.css`
- Follow mobile-first responsive design
- Maintain consistent spacing using theme values
- Use semantic class names

### JavaScript Guidelines
- Use ES6+ modern JavaScript
- Follow modular architecture in `assets/js/`
- Add proper error handling
- Document complex functions

### HTML Guidelines
- Use semantic HTML5 elements
- Ensure accessibility (ARIA labels, alt text)
- Follow WordPress block theme structure
- Validate markup

## 🎨 Design Guidelines

### Visual Consistency
- Follow the quantum sentiment color scheme
- Maintain minimalist aesthetic
- Ensure high contrast ratios (WCAG AA)
- Use consistent spacing and typography

### Brand Elements
- Respect the "aura" visual effects
- Maintain category icon consistency
- Follow established UI patterns

## 📚 Resources

### WordPress Resources
- [Block Theme Developer Handbook](https://developer.wordpress.org/themes/block-themes/)
- [WordPress Coding Standards](https://developer.wordpress.org/coding-standards/)

### Project Resources
- [Theme Structure Documentation](./olon-tv-block-theme/README.md)
- [Supabase Integration Guide](./SUPABASE-STORAGE-SOLUTION.md)

## 🤝 Community Guidelines

### Be Respectful
- Use inclusive language
- Be patient with new contributors
- Provide constructive feedback
- Help others learn and grow

### Communication
- Ask questions in issues/discussions
- Provide clear descriptions
- Share screenshots for visual changes
- Document your decisions

## 🏆 Recognition

Contributors will be:
- Added to the contributors list
- Credited in release notes
- Invited to project discussions
- Given priority for future opportunities

## 📧 Questions?

- Open a [Discussion](https://github.com/gbysea/BOLT-WordPress-Block-Theme/discussions)
- Comment on relevant issues
- Check existing documentation first

---

Thank you for contributing to OLON WordPress Block Theme! 🎉