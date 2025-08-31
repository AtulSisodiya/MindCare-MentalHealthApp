/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    './pages/**/*.{js,ts,jsx,tsx,mdx}',
    './components/**/*.{js,ts,jsx,tsx,mdx}',
    './app/**/*.{js,ts,jsx,tsx,mdx}',
  ],
  theme: {
    extend: {
      fontFamily: {
        'sans': ['Inter', 'system-ui', 'sans-serif'],
        'display': ['Poppins', 'system-ui', 'sans-serif'],
      },
      colors: {
        // Beige base palette
        beige: {
          50: '#fefdfb',
          100: '#fdf9f3',
          200: '#f9f0e3',
          300: '#f4e6d1',
          400: '#edd5b3',
          500: '#e4c294',
          600: '#d4a574',
          700: '#c08a56',
          800: '#a06d42',
          900: '#825637',
        },
        // Pink accent palette for mental health warmth
        rose: {
          50: '#fef7f7',
          100: '#fdedef',
          200: '#fbd9dc',
          300: '#f7b8be',
          400: '#f18a96',
          500: '#e85d75',
          600: '#d63c5e',
          700: '#b8294c',
          800: '#9a2444',
          900: '#822040',
        },
        // Soft complementary colors
        cream: {
          50: '#fefcfa',
          100: '#fdf8f2',
          200: '#faf0e2',
          300: '#f6e5cd',
          400: '#f0d6b0',
          500: '#e8c48e',
          600: '#ddb06a',
          700: '#cd9850',
          800: '#b8824a',
          900: '#9a6d3e',
        },
        // Muted pastels for UI elements
        soft: {
          pink: '#f4c2c2',
          peach: '#f5d5ae',
          lavender: '#e6d7f0',
          mint: '#c8e6c9',
          sky: '#b3d9f2',
          coral: '#ffb3ba',
        }
      },
      boxShadow: {
        'gentle': '0 1px 3px 0 rgba(0, 0, 0, 0.05), 0 1px 2px 0 rgba(0, 0, 0, 0.03)',
        'soft': '0 4px 6px -1px rgba(0, 0, 0, 0.07), 0 2px 4px -1px rgba(0, 0, 0, 0.03)',
        'warm': '0 10px 15px -3px rgba(212, 165, 116, 0.1), 0 4px 6px -2px rgba(212, 165, 116, 0.05)',
        'rose': '0 10px 15px -3px rgba(232, 93, 117, 0.1), 0 4px 6px -2px rgba(232, 93, 117, 0.05)',
      },
    },
  },
  plugins: [],
}