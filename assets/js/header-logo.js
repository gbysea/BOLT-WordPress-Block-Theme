/**
 * OLON Sentiment TV - Header Logo Module
 * Manages the dynamic category logo and header styling
 */

window.olonHeaderLogo = {
  currentCategory: 'top',
  currentPageTitle: null,

  init() {
    this.updateLogo('top');
  },

  updateLogo(categorySlug, pageTitle = null) {
    const logoContainer = document.querySelector('.site-logo');
    const header = document.querySelector('.site-header');
    const body = document.body;

    if (logoContainer) {
      this.currentCategory = categorySlug;
      this.currentPageTitle = pageTitle;

      const existingIcon = logoContainer.querySelector('.site-logo-icon-wrapper');
      if (existingIcon) {
        existingIcon.remove();
      }

      // Update title text
      const titleSpan = logoContainer.querySelector('span');
      if (titleSpan) {
        if (pageTitle) {
          titleSpan.textContent = pageTitle;
        } else {
          titleSpan.textContent = 'OLON Sentiment TV';
        }
      }

      const imagePath = typeof OLON_CONFIG !== 'undefined' && OLON_CONFIG.themeUrl
        ? `${OLON_CONFIG.themeUrl}/assets/images`
        : '/assets/images';

      const iconWrapper = document.createElement('div');
      iconWrapper.className = 'site-logo-icon-wrapper';
      iconWrapper.innerHTML = `
        <img src="${imagePath}/${categorySlug}-HOVER-olon-120.png"
             class="site-logo-icon site-logo-icon-default"
             alt="${categorySlug} category"
             width="40"
             height="40">
        <img src="${imagePath}/${categorySlug}-UP-olon-120.png"
             class="site-logo-icon site-logo-icon-hover"
             alt="${categorySlug} category hover"
             width="40"
             height="40">
      `;

      logoContainer.insertBefore(iconWrapper, logoContainer.firstChild);
    }

    if (header) {
      header.className = `site-header category-${categorySlug}`;
    }

    if (body) {
      body.className = body.className.replace(/category-mode-\w+/g, '').trim();
      body.classList.add(`category-mode-${categorySlug}`);
    }

    // Update page title
    this.updatePageTitle(categorySlug, pageTitle);
  },

  updatePageTitle(categorySlug, pageTitle = null) {
    const categoryName = categorySlug.toUpperCase();

    if (pageTitle) {
      document.title = `${pageTitle} | ${categoryName} - OLON Sentiment TV`;
    } else {
      // Check what page we're on
      const path = window.location.pathname;

      if (path === '/' || path === '/index.html') {
        document.title = 'OLON Sentiment TV - Quantum Sentiment Universe';
      } else if (path.includes('/category/')) {
        document.title = `${categoryName} Category - OLON Sentiment TV`;
      } else {
        document.title = `${categoryName} - OLON Sentiment TV`;
      }
    }
  },

  getCurrentCategory() {
    return this.currentCategory;
  },

  getCurrentPageTitle() {
    return this.currentPageTitle;
  }
};
