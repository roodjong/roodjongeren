import "../styles/globals.css";
import type { AppProps } from "next/app";
import Layout from "../components/Layout";
import Head from "next/head";
import Script from "next/script";

export default function RoodJongerenApp({ Component, pageProps }: AppProps) {
    return (
        <Layout>
            <Head>
                <title>ROOD, Socialistische Jongeren</title>
            </Head>
            <Component {...pageProps} />
        </Layout>
    );
}
