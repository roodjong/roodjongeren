import '../styles/globals.css';
import type {AppProps} from 'next/app';
import Layout from '../components/Layout';
import Head from 'next/head';

export default function RoodJongerenApp({Component, pageProps}: AppProps) {
    return <Layout>
        <Head>
            <title>ROOD, Socialistische Jongeren</title>
            <script async defer data-website-id="2b3534fb-1af5-4fa4-93f6-0fa62a239ae1" src="/umami/stasi.js"></script>
        </Head>
        <Component {...pageProps} />
    </Layout>;
}
