const colors = require('tailwindcss/colors');
const defaultTheme = require('tailwindcss/defaultTheme');

/**
 * @type { import('@types/tailwindcss/tailwind-config').TailwindConfig }
 */
module.exports = {
  content: ['./theme/**/*.ftl'],
  experimental: {
    optimizeUniversalDefaults: true,
  },
  plugins: [require('@tailwindcss/forms')],
  theme: {
    extend: {
      colors: {
        primary: colors.emerald,
        secondary: colors.zinc,
        accent: colors.pink
      },
      listStyleType: {
        square: 'square',
      }
    },
    fontFamily: {
      'sans': ['"Signika Negative"', '"Source Sans Pro"', ...defaultTheme.fontFamily.sans],
      'mono': ['"JetBrains Mono"', ...defaultTheme.fontFamily.mono],
    },
  },
};
