function initAura(sentimentSlug = 'top') {
  const container = document.getElementById('aura-container');
  if (!container) return;
  container.className = 'aura-background';
  container.classList.add(`aura-${sentimentSlug}`);
  container.classList.add(`category-${sentimentSlug}`);
}

function changeAuraSentiment(sentimentSlug) {
  initAura(sentimentSlug);
}

function applyCategoryColors(category) {
  if (!category) return;
  const root = document.documentElement;
  root.style.setProperty('--category-color', category.color);
  root.style.setProperty('--category-color-light', category.gradient_start);
  root.style.setProperty('--category-color-dark', category.gradient_end);
}

window.olonAura = {
  initAura,
  changeAuraSentiment,
  applyCategoryColors
};
