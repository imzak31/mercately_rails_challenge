const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './app/**/*.html.erb',
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  darkMode: 'class',
  theme: {
    extend: {
      colors: {
        navy: {
          50: '#f5f8fb',
          100: '#e6eff6',
          200: '#c0d8eb',
          300: '#9ac1e0',
          400: '#4d93ca',
          500: '#0065b5',
          600: '#005ba3',
          700: '#004d88',
          800: '#003e6e',
          900: '#003258',
        },
        indigo: {
          600: '#4f46e5',
          700: '#4338ca'
        },
      },
      fontFamily: {
        sans: ['Inter var', ...defaultTheme.fontFamily.sans],
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
  ]
}
