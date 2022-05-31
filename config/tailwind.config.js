const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    extend: {
      colors: {
        'silver': '#BFBFBF',
        'alabaster': '#F9F9F9',
        'seashell': '#F1F1F1',
        'mercury': '#E8E8E8',
        'alto': '#DEDEDE',
        'dusty-gray': '#9C9C9C',
        'mine-shaft': '#1F1F1F',
        'light-brown': '#FBB286',
        'brown': '#DB986F',
        'dark-brown': '#9E4E1E',
        'apricot-peach': '#FBC9AA',
        'jaffa': '#E98143',
        'brandy-rose': '#BD8787',
        'apple-blossom': '#A54242',
        'downriver': '#0B194F',
        'azure': '#3D55B0',
      },
      fontFamily: {
        sans: ['Montserrat', 'sans-serif'],
        train: ['Train One', 'cursive'],
      },
      width: {
        '180': '180px',
      },
      borderRadius: {
        'x': '10px',
      },
      boxShadow: {
        'main': '0px 15px 30px rgba(0, 0, 0, 0.15)',
        'header': '0px 5px 30px rgba(0, 0, 0, 0.15)',
        'about-right': '6px 7px 4px rgba(0, 0, 0, 0.25)',
        'about-left': '-6px 7px 4px rgba(0, 0, 0, 0.25)',
        'edit-profile': '0px 0px 30px 0px #0000004d',
      },
      transitionDuration: {
        '400': '400ms',
      },
      backgroundImage: {
        'worker': "url('jeriden-villegas-VLPUm5wP5Z0-unsplash.jpg')",
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/line-clamp'),
  ]
}
