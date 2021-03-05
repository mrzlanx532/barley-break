module.exports = {
  purge: [
      './resources/**/*.blade.php',
      './resources/**/*.js',
      './resources/**/*.vue',
  ],
  darkMode: false, // or 'media' or 'class'
  theme: {
      extend: {
          colors: {
            brown: {
                soft: '#FFB773',
                middle: '#FF9D40',
                contrast: '#FF7C00',
                strict: '#BF7630',
                dark: '#A65100',
            }
          }
      }
  },
  variants: {
    extend: {},
  },
  plugins: [],
}
