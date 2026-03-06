/** @type {import('tailwindcss').Config} */
export default {
  content: [
    "./index.html",
    "./src/**/*.{js,jsx,tsx}",
  ],
  theme: {
    extend: {
      colors: {
        ecoGreen: "#00ff9a",
      },
    },
  },
  plugins: [],
}