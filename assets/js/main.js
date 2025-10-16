/**
 * OLON Sentiment TV - Main Entry Point
 * Initializes all modules and handles page-specific logic
 */

const CATEGORY_DESCRIPTIONS = {
  top: 'Peak sentiment intensity • Maximum positive resonance • Highest energy state',
  up: 'Rising optimism • Ascending momentum • Upward trajectory of positivity',
  charm: 'Delightful experiences • Captivating moments • Enchanting perspectives',
  bottom: 'Foundational depth • Core stability • Grounded authenticity',
  down: 'Introspective descent • Deep reflection • Contemplative exploration',
  strange: 'Unusual patterns • Unexpected insights • Unconventional perspectives'
};

document.addEventListener('DOMContentLoaded', async () => {
  console.log('OLON Sentiment TV initializing...');

  // Check if config exists (for WordPress environment)
  if (typeof OLON_CONFIG !== 'undefined') {
    console.log('OLON_CONFIG loaded (WordPress mode):', {
      hasSupabaseUrl: !!OLON_CONFIG.supabaseUrl,
      hasAnonKey: !!OLON_CONFIG.supabaseAnonKey,
      themeUrl: OLON_CONFIG.themeUrl
    });
  } else {
    console.log('Running in standalone mode');
  }

  // Initialize Supabase
  if (window.olonDB && window.olonDB.initSupabase) {
    await window.olonDB.initSupabase();
  }

  // Initialize header logo
  if (window.olonHeaderLogo && window.olonHeaderLogo.init) {
    window.olonHeaderLogo.init();
  }

  // Determine page context
  const path = window.location.pathname;
  const urlParams = new URLSearchParams(window.location.search);

  if (path.includes('/category/')) {
    // Category archive page - WordPress permalink style
    const slug = path.split('/category/')[1].replace(/\/$/, '');
    console.log('Loading category:', slug);

    const category = await window.olonDB.getCategoryBySlug(slug);

    if (category) {
      const h1 = document.querySelector('h1');
      const subtitle = document.querySelector('.hero-subtitle');

      if (h1) h1.textContent = category.name;
      if (subtitle && CATEGORY_DESCRIPTIONS[category.slug]) {
        subtitle.textContent = CATEGORY_DESCRIPTIONS[category.slug];
      }

      await loadPostsByCategory(category.id);

      if (window.olonAura) {
        window.olonAura.changeAuraSentiment(category.slug);
      }
      if (window.olonHeaderLogo) {
        window.olonHeaderLogo.updateLogo(category.slug, category.name);
      }
    }
  } else if (path.includes('/post/')) {
    // Single post page - WordPress permalink style
    const slug = path.split('/post/')[1].replace(/\/$/, '');
    console.log('Loading post:', slug);

    const post = await window.olonDB.getPostBySlug(slug);

    if (post) {
      const h1 = document.querySelector('h1');
      const contentBody = document.querySelector('.post-content-body');

      if (h1) h1.textContent = post.title;
      if (contentBody) contentBody.innerHTML = post.content;

      if (post.category) {
        if (window.olonAura) {
          window.olonAura.changeAuraSentiment(post.category.slug);
        }
        if (window.olonHeaderLogo) {
          window.olonHeaderLogo.updateLogo(post.category.slug, post.title);
        }
      }
    }
  } else if (urlParams.has('slug')) {
    // Legacy query string support for static site
    const slug = urlParams.get('slug');

    if (path.includes('category.html')) {
      const category = await window.olonDB.getCategoryBySlug(slug);
      if (category) {
        const h1 = document.querySelector('h1');
        const subtitle = document.querySelector('.hero-subtitle');

        if (h1) h1.textContent = category.name;
        if (subtitle && CATEGORY_DESCRIPTIONS[category.slug]) {
          subtitle.textContent = CATEGORY_DESCRIPTIONS[category.slug];
        }

        await loadPostsByCategory(category.id);
        if (window.olonAura) window.olonAura.changeAuraSentiment(category.slug);
        if (window.olonHeaderLogo) window.olonHeaderLogo.updateLogo(category.slug, category.name);
      }
    } else if (path.includes('post.html')) {
      const post = await window.olonDB.getPostBySlug(slug);
      if (post) {
        if (post.category) {
          if (window.olonAura) window.olonAura.changeAuraSentiment(post.category.slug);
          if (window.olonHeaderLogo) window.olonHeaderLogo.updateLogo(post.category.slug, post.title);
        }
      }
    }
  } else {
    // Homepage
    console.log('Loading homepage');

    if (typeof loadCategories === 'function') {
      await loadCategories();
    } else if (window.loadCategories) {
      await window.loadCategories();
    }

    if (typeof loadRecentPosts === 'function') {
      await loadRecentPosts();
    } else if (window.loadRecentPosts) {
      await window.loadRecentPosts();
    }

    if (window.olonAura) {
      window.olonAura.initAura('top');
    }

    if (window.olonHeaderLogo) {
      window.olonHeaderLogo.updateLogo('top', 'Quantum Sentiment Universe');
    }
  }

  console.log('OLON Sentiment TV initialized successfully');
});

// Expose functions globally for cross-module access
if (typeof loadPostsByCategory === 'function') {
  window.loadPostsByCategory = loadPostsByCategory;
}
