import { defineConfig } from 'vite';

export default defineConfig({
  server: {
    port: 5173,
    open: true
  },
  build: {
    rollupOptions: {
      input: {
        main: './index.html',
        category: './category.html',
        post: './post.html'
      }
    }
  },
  appType: 'mpa',
  plugins: [
    {
      name: 'rewrite-middleware',
      configureServer(server) {
        server.middlewares.use((req, res, next) => {
          if (req.url.startsWith('/category/')) {
            req.url = '/category.html' + req.url.replace('/category/', '?category=');
          } else if (req.url.match(/^\/post\/\d+/)) {
            const postId = req.url.match(/\/post\/(\d+)/)[1];
            req.url = '/post.html?id=' + postId;
          }
          next();
        });
      }
    }
  ]
});
