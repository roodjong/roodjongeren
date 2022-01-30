import '../styles/globals.css'
import type {AppProps} from 'next/app'
import Layout from "../components/Layout";

export default function RoodJongerenApp({Component, pageProps}: AppProps) {
    return <Layout>
        <Component {...pageProps} />
    </Layout>;
}
