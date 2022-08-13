/**
 * @type { import("snowpack").SnowpackUserConfig }
 */

module.exports = {
  buildOptions: {
    out: './theme/keywind/login/resources',
  },
  devOptions: {
    tailwindConfig: './tailwind.config.js',
  },
  mount: {
    'src': '/dist',
    'static': { url: '/static', static: true },
    'node_modules/@fontsource/source-sans-pro/': '/fonts/source-sans-pro',
    'node_modules/@fontsource/signika-negative/': '/fonts/signika-negative',
  },
  optimize: {
    bundle: true,
    entrypoints: ['./src/index.js'],
    minify: true,
    target: 'es2017',
  },
  plugins: ['@snowpack/plugin-postcss'],
};
