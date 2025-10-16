/**
 * OLON Sentiment TV - Main Entry Point
 * Initializes all modules and handles page-specific logic
 */

document.addEventListener('DOMContentLoaded', async () => {
  console.log('OLON Sentiment TV initializing...');

  // Check if config exists
  if (typeof OLON_CONFIG !== 'undefined') {
    console.log('OLON_CONFIG loaded:', {
      hasSupabaseUrl: !!OLON_CONFIG.supabaseUrl,
      hasAnonKey: !!OLON_CONFIG.supabaseAnonKey,
      themeUrl: OLON_CONFIG.themeUrl
    });
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
      if (h1) h1.textContent = category.name;

      await loadPostsByCategory(category.id);

      if (window.olonAura) {
        window.olonAura.changeAuraSentiment(category.slug);
      }
      if (window.olonHeaderLogo) {
        window.olonHeaderLogo.updateLogo(category.slug);
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
          window.olonHeaderLogo.updateLogo(post.category.slug);
        }
      }
    }
  } else if (urlParams.has('slug')) {
    // Legacy query string support for static site
    const slug = urlParams.get('slug');

    if (path.includes('category.html')) {
      const category = await window.olonDB.getCategoryBySlug(slug);
      if (category) {
        await loadPostsByCategory(category.id);
        if (window.olonAura) window.olonAura.changeAuraSentiment(category.slug);
        if (window.olonHeaderLogo) window.olonHeaderLogo.updateLogo(category.slug);
      }
    } else if (path.includes('post.html')) {
      const post = await window.olonDB.getPostBySlug(slug);
      if (post && post.category) {
        if (window.olonAura) window.olonAura.changeAuraSentiment(post.category.slug);
        if (window.olonHeaderLogo) window.olonHeaderLogo.updateLogo(post.category.slug);
      }
    }
  } else {
    // Homepage
    console.log('Loading homepage');

    if (typeof loadCategories !== 'undefined') {
      await loadCategories();
    }
    if (typeof loadRecentPosts !== 'undefined') {
      await loadRecentPosts();
    }

    if (window.olonAura) {
      window.olonAura.initAura('top');
    }
  }

  console.log('OLON Sentiment TV initialized successfully');
});

async function loadCategories() {
  const grid = document.getElementById('category-grid');
  if (!grid) return;

  try {
    const categories = await window.olonDB.getCategories();

    if (!categories || categories.length === 0) {
      grid.innerHTML = '<p class="text-center">No categories found.</p>';
      return;
    }

    grid.innerHTML = '';

    for (const category of categories) {
      const count = await window.olonDB.getCategoryPostCount(category.id);

      const card = document.createElement('a');
      card.href = `/category.html?slug=${category.slug}`;
      card.className = `category-card category-${category.slug}`;

      card.addEventListener('mouseenter', () => {
        if (window.olonAura) {
          window.olonAura.changeAuraSentiment(category.slug);
        }
        if (window.olonHeaderLogo) {
          window.olonHeaderLogo.updateLogo(category.slug);
        }
      });

      card.innerHTML = `
        <div class="category-logo">
          <img src="/images/${category.slug}-UP-olon-120.png"
               class="category-logo-default"
               alt="${category.name} logo"
               width="120"
               height="120">
          <img src="/images/${category.slug}-HOVER-olon-120.png"
               class="category-logo-hover"
               alt="${category.name} logo hover"
               width="120"
               height="120">
        </div>
        <div class="category-name">${category.name}</div>
        <div class="category-count">${count} posts</div>
      `;

      grid.appendChild(card);
    }
  } catch (error) {
    console.error('Error loading categories:', error);
    grid.innerHTML = '<p class="text-center">Error loading categories.</p>';
  }
}

async function loadRecentPosts(limit = 6) {
  const grid = document.getElementById('post-grid');
  if (!grid) return;

  try {
    const posts = await window.olonDB.getPosts(limit);

    if (!posts || posts.length === 0) {
      grid.innerHTML = '<p class="text-center">No posts found.</p>';
      return;
    }

    grid.innerHTML = '';

    posts.forEach(post => {
      const card = document.createElement('a');
      card.href = `/post.html?slug=${post.slug}`;
      card.className = 'post-card';

      const thumbnailHtml = post.featured_image
        ? `<img src="${post.featured_image}" alt="${post.title}" loading="lazy">`
        : '';

      const categoryClass = post.category ? `badge-${post.category.slug}` : 'badge-top';
      const categoryName = post.category ? post.category.name : 'UNCATEGORIZED';

      card.innerHTML = `
        <div class="post-thumbnail">${thumbnailHtml}</div>
        <div class="post-content">
          <span class="badge ${categoryClass}">${categoryName}</span>
          <h3 class="post-title">${post.title}</h3>
          <p class="post-excerpt">${post.excerpt || ''}</p>
          <div class="post-meta">
            <span>${new Date(post.created_at).toLocaleDateString()}</span>
            ${post.view_count > 0 ? `<span>${post.view_count} views</span>` : ''}
          </div>
        </div>
      `;

      grid.appendChild(card);
    });
  } catch (error) {
    console.error('Error loading posts:', error);
    grid.innerHTML = '<p class="text-center">Error loading posts.</p>';
  }
}

async function loadPostsByCategory(categoryId) {
  const grid = document.getElementById('post-grid');
  if (!grid) return;

  try {
    const posts = await window.olonDB.getPostsByCategory(categoryId);

    if (!posts || posts.length === 0) {
      grid.innerHTML = '<p class="text-center">No posts in this category yet.</p>';
      return;
    }

    grid.innerHTML = '';

    posts.forEach(post => {
      const card = document.createElement('a');
      card.href = `/post.html?slug=${post.slug}`;
      card.className = 'post-card';

      const categoryClass = post.category ? `badge-${post.category.slug}` : 'badge-top';
      const categoryName = post.category ? post.category.name : 'UNCATEGORIZED';

      card.innerHTML = `
        <div class="post-content">
          <span class="badge ${categoryClass}">${categoryName}</span>
          <h3 class="post-title">${post.title}</h3>
          <p class="post-excerpt">${post.excerpt || ''}</p>
          <div class="post-meta">
            <span>${new Date(post.created_at).toLocaleDateString()}</span>
          </div>
        </div>
      `;

      grid.appendChild(card);
    });
  } catch (error) {
    console.error('Error loading posts:', error);
    grid.innerHTML = '<p class="text-center">Error loading posts.</p>';
  }
}
