/**
 * OLON Sentiment TV - Header Logo Module
 * Manages the dynamic category logo and header styling
 */

window.olonHeaderLogo = {
  currentCategory: 'top',

  init() {
    this.updateLogo('top');
  },

  updateLogo(categorySlug) {
    const logoContainer = document.querySelector('.site-logo');
    const header = document.querySelector('.site-header');
    const body = document.body;

    if (logoContainer) {
      this.currentCategory = categorySlug;

      const existingIcon = logoContainer.querySelector('.site-logo-icon-wrapper');
      if (existingIcon) {
        existingIcon.remove();
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
             width="120"
             height="120">
        <img src="${imagePath}/${categorySlug}-UP-olon-120.png"
             class="site-logo-icon site-logo-icon-hover"
             alt="${categorySlug} category hover"
             width="120"
             height="120">
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
  },

  getCurrentCategory() {
    return this.currentCategory;
  }
};
