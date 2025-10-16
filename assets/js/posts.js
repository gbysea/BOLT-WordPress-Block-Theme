/**
 * OLON Sentiment TV - Posts Module
 */

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
      const card = createPostCard(post);
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
      const card = createPostCard(post);
      grid.appendChild(card);
    });
  } catch (error) {
    console.error('Error loading posts:', error);
    grid.innerHTML = '<p class="text-center">Error loading posts.</p>';
  }
}

function createPostCard(post) {
  const card = document.createElement('a');
  card.href = `/post/${post.slug}`;
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
        <span>${formatDate(post.created_at)}</span>
        ${post.view_count > 0 ? `<span>${post.view_count} views</span>` : ''}
      </div>
    </div>
  `;

  return card;
}

function formatDate(dateString) {
  const date = new Date(dateString);
  const options = { year: 'numeric', month: 'short', day: 'numeric' };
  return date.toLocaleDateString('en-US', options);
}
