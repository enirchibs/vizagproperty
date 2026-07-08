export default {
  content: [
    "./index.html",
    "./src/**/*.{js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {
      colors: {
        primary: {
          50: '#eef4ff',
          100: '#dce8ff',
          200: '#b1cdff',
          300: '#75a6ff',
          400: '#4079ff',
          500: '#1b52f5',
          600: '#0F52BA',
          700: '#093c8b',
          800: '#0a3273',
          900: '#0d2d5b',
        },
        accent: {
          50: '#fff8eb',
          100: '#ffefc6',
          200: '#ffdb88',
          300: '#ffc34a',
          400: '#ffa71b',
          500: '#ff8a00',
          600: '#FF6B00',
          700: '#cc4d00',
          800: '#a13b08',
          900: '#82320b',
        },
        success: {
          50: '#f0fdf4',
          100: '#dcfce7',
          200: '#bbf7d0',
          300: '#86efac',
          400: '#4ade80',
          500: '#22c55e',
          600: '#16A34A',
          700: '#15803d',
          800: '#166534',
          900: '#14532d',
        },
      },
      animation: {
        'fade-in': 'fadeIn 0.3s ease-in-out',
        'slide-up': 'slideUp 0.3s ease-out',
        'slide-up-modal': 'slideUpModal 0.25s ease-out',
        'pulse-slow': 'pulse 3s cubic-bezier(0.4, 0, 0.6, 1) infinite',
      },
      keyframes: {
        fadeIn: {
          '0%': { opacity: '0' },
          '100%': { opacity: '1' },
        },
        slideUp: {
          '0%': { transform: 'translateY(10px)', opacity: '0' },
          '100%': { transform: 'translateY(0)', opacity: '1' },
        },
        slideUpModal: {
          '0%': { transform: 'translateY(100%)' },
          '100%': { transform: 'translateY(0)' },
        },
      },
    },
  },
  plugins: [],
}
