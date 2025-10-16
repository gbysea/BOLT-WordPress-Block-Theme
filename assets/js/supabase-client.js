const SUPABASE_URL = (typeof OLON_CONFIG !== 'undefined' && OLON_CONFIG.supabaseUrl)
  ? OLON_CONFIG.supabaseUrl
  : (window.OLON_SUPABASE_URL || 'https://irbflzzuamvvujebhter.supabase.co');
const SUPABASE_ANON_KEY = (typeof OLON_CONFIG !== 'undefined' && OLON_CONFIG.supabaseAnonKey)
  ? OLON_CONFIG.supabaseAnonKey
  : (window.OLON_SUPABASE_ANON_KEY || 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImlyYmZsenp1YW12dnVqZWJodGVyIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjA0NDAwOTYsImV4cCI6MjA3NjAxNjA5Nn0.MaKWPrMGIZYDC7r084VnkI4Gvji5cC0c8s4kgTqXHP0');

let supabase = null;

async function initSupabase() {
  if (typeof window.supabase === 'undefined') {
    console.error('Supabase library not loaded');
    return null;
  }

  if (!SUPABASE_URL || !SUPABASE_ANON_KEY) {
    console.error('Supabase credentials not configured');
    return null;
  }

  supabase = window.supabase.createClient(SUPABASE_URL, SUPABASE_ANON_KEY);
  console.log('Supabase initialized successfully');
  return supabase;
}

async function getCategories() {
  if (!supabase) await initSupabase();
  const { data, error } = await supabase
    .from('categories')
    .select('*')
    .order('sort_order', { ascending: true });
  if (error) {
    console.error('Error fetching categories:', error);
    return [];
  }
  return data || [];
}

async function getCategoryBySlug(slug) {
  if (!supabase) await initSupabase();
  const { data, error } = await supabase
    .from('categories')
    .select('*')
    .eq('slug', slug)
    .maybeSingle();
  if (error) {
    console.error('Error fetching category:', error);
    return null;
  }
  return data;
}

async function getPosts(limit = 20) {
  if (!supabase) await initSupabase();
  const { data, error } = await supabase
    .from('posts')
    .select('*, category:categories(*)')
    .eq('published', true)
    .order('created_at', { ascending: false })
    .limit(limit);
  if (error) {
    console.error('Error fetching posts:', error);
    return [];
  }
  return data || [];
}

async function getPostsByCategory(categoryId) {
  if (!supabase) await initSupabase();
  const { data, error } = await supabase
    .from('posts')
    .select('*, category:categories(*)')
    .eq('category_id', categoryId)
    .eq('published', true)
    .order('created_at', { ascending: false });
  if (error) {
    console.error('Error fetching posts by category:', error);
    return [];
  }
  return data || [];
}

async function getPostBySlug(slug) {
  if (!supabase) await initSupabase();
  const { data, error } = await supabase
    .from('posts')
    .select('*, category:categories(*)')
    .eq('slug', slug)
    .eq('published', true)
    .maybeSingle();
  if (error) {
    console.error('Error fetching post:', error);
    return null;
  }
  return data;
}

async function getCategoryPostCount(categoryId) {
  if (!supabase) await initSupabase();
  const { count, error } = await supabase
    .from('posts')
    .select('*', { count: 'exact', head: true })
    .eq('category_id', categoryId)
    .eq('published', true);
  if (error) {
    console.error('Error fetching category post count:', error);
    return 0;
  }
  return count || 0;
}

window.olonDB = {
  initSupabase,
  getCategories,
  getCategoryBySlug,
  getPosts,
  getPostsByCategory,
  getPostBySlug,
  getCategoryPostCount
};
