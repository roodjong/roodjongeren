/** @type {import('next').NextConfig} */

const withTM = require('next-transpile-modules')(['react-icons/fa', 'react-icons/lib']);

module.exports = withTM({
    reactStrictMode: true,
    async redirects() {
        return [
            {source: '/nieuws', destination: '/nieuws/page/1', permanent: true}
        ]
    }
});
