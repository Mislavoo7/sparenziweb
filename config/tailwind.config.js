const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/assets/stylesheets/**/*.scss',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    extend: {
      aspectRatio: {
        'square': '1/1',
      },
      fontFamily: {
        serif: ["'Libre Caslon Text'", ...defaultTheme.fontFamily.serif],
        sans: ['Montserrat', ...defaultTheme.fontFamily.sans],
      },
      maxWidth: {
        '7xl': '81rem',
      },
      colors: {
        background: {
          DEFAULT: '#fbf7f4',
          highlighted: '#f7f4ed',
          'highlighted-2': '#ede6d3',
          'highlighted-3': '#edeae1',
          inverted: '#3a3631'
        },
        foreground: {
          DEFAULT: '#4a4a47',
          'inverted': '#fbf7f4'
        },
        accent: {
          DEFAULT: '#c5ae8f'
        },
        'primary': {
          50: '#fffaf0', 
          100: '#fef3c7',
          200: '#fde68a',
          300: '#fcd34d',
          400: '#fbbf24',
          500: '#f59e0b',
          600: '#d97706',
          700: '#b45309',
          800: '#92400e',
          900: '#78350f',
        },
        'secondary': {
          50: '#fff1f0', 
          100: '#ffe4e6',
          200: '#fecdd3',
          300: '#fda4af', 
          400: '#fb7185',
          500: '#f43f5e', 
          600: '#e11d48',
          700: '#be123c',
          800: '#9f1239',
          900: '#881337', 
        }
      },
      typography: (theme) => ({
        DEFAULT: {
          css: {
            '--tw-prose-headings': theme('colors.foreground.DEFAULT'),
            color: theme('colors.foreground.DEFAULT'),
          },
        },
        lg: {
          css: {
            color: theme('colors.foreground.DEFAULT'),
            'line-height': '1.3',
          },
        }
      }),
    },
    aspectRatio: {
      'video': '16/9',
      'big-image': '316/277'
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
  ]
}
