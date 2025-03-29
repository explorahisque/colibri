import { defineConfig } from 'vite'
import vue from '@vitejs/plugin-vue'
import Markdown from 'vite-plugin-markdown'
import svgLoader from 'vite-svg-loader'
import path from 'path'

export default defineConfig({
  base: '/',
  plugins: [
    vue(),
    Markdown.default(), // Usar Markdown como una llamada de función
    svgLoader(),
  ],
  resolve: {
    alias: {
      '@': path.resolve(__dirname, 'src'),
      'assets': path.resolve(__dirname, 'src/assets'),
      'content': path.resolve(__dirname, 'src/content')
    }
  },
  build: {
    assetsDir: 'assets',
  },
  server: {
    fs: {
      strict: false,
    }
  }
})