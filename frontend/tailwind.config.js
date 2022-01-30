module.exports = {
    content: [
        './src/pages/**/*.{js,ts,jsx,tsx}',
        './src/components/**/*.{js,ts,jsx,tsx}'
    ],
    theme: {
        fontFamily: {
            title: ['Bebas Neue Pro', 'Arial', 'sans-serif'],
            sans: ['Arial', 'sans-serif'],
        },
        extend: {
            colors: {
                primary: '#C2000B',
                secondary: '#111111',
                regular: '#565656',
                faded: '#9b9b9b'
            },
            backgroundImage: {
                banner: 'url(\'/images/banner.webp\')'
            }
        },
    },
    plugins: [],
}