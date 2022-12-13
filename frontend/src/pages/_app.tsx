import "../styles/globals.css";
import type { AppProps } from "next/app";
import Layout from "../components/Layout";
import Head from "next/head";

export default function RoodJongerenApp({ Component, pageProps }: AppProps) {
    return (
        <Layout>
            <Head>
                <title>ROOD, Socialistische Jongeren</title>
                <script
                    async
                    defer
                    data-website-id="96e32064-8d01-434b-98ab-7a14c468669c"
                    src="/umami/stasi.js"
                ></script>
            </Head>
            <Component {...pageProps} />
        </Layout>
    );
}
