/** @type {import('tailwindcss').Config} */
export default {
  content: ["./index.html", "./src/**/*.{js,ts,jsx,tsx}"],
  theme: {
    extend: {
      fontFamily: {
        roboto: "var(--font-roboto)",
      },
      colors: {
        white: "var(--color-white)",
        bgGray: "var(--color-dark-gray)",
        bgDarkgray: "var(--color-darker-gray)",
        purpleBTN: "var(--color-purple)",
        redBTN: "var(--color-red)",
        cardColor: "var(--color-yellow)"
      },
    },
  },
  plugins: [],
};
