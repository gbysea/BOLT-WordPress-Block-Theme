/**
 * OLON Sentiment TV - Categories Module
 */

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
      const card = createCategoryCard(category, count);
      grid.appendChild(card);
    }
  } catch (error) {
    console.error('Error loading categories:', error);
    grid.innerHTML = '<p class="text-center">Error loading categories.</p>';
  }
}

function createCategoryCard(category, postCount = 0) {
  const card = document.createElement('a');
  card.href = `/category/${category.slug}`;
  card.className = `category-card category-${category.slug}`;

  card.addEventListener('mouseenter', () => {
    window.olonAura.changeAuraSentiment(category.slug);
    if (window.olonHeaderLogo) {
      window.olonHeaderLogo.updateLogo(category.slug);
    }
  });

  card.innerHTML = `
    <div class="category-logo">
      <img src="${typeof OLON_CONFIG !== 'undefined' && OLON_CONFIG.themeUrl ? OLON_CONFIG.themeUrl + '/assets/images' : '/assets/images'}/${category.slug}-UP-olon-120.png"
           class="category-logo-default"
           alt="${category.name} logo"
           width="120"
           height="120">
      <img src="${typeof OLON_CONFIG !== 'undefined' && OLON_CONFIG.themeUrl ? OLON_CONFIG.themeUrl + '/assets/images' : '/assets/images'}/${category.slug}-HOVER-olon-120.png"
           class="category-logo-hover"
           alt="${category.name} logo hover"
           width="120"
           height="120">
    </div>
    <div class="category-name">${category.name}</div>
  `;

  return card;
}

async function loadFooterCategories() {
  const container = document.getElementById('footer-categories');
  if (!container) return;

  try {
    const categories = await window.olonDB.getCategories();

    categories.forEach(cat => {
      const link = document.createElement('a');
      link.href = `/category/${cat.slug}`;
      link.textContent = cat.name;
      link.style.display = 'block';
      link.style.marginBottom = 'var(--space-2)';
      container.appendChild(link);
    });
  } catch (error) {
    console.error('Error loading footer categories:', error);
  }
}

// Expose functions globally
window.loadCategories = loadCategories;
window.loadFooterCategories = loadFooterCategories;
