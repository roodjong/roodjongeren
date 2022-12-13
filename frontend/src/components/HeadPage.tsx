import Head from "next/head";

interface Props {
    title: string;
    description: string;
    url: string;
}

export default function HeadPage(props: Props) {
    return (
        <Head>
            <title>{props.title}</title>
            <meta name="description" content={props.description} />
            <meta property="og:title" content={props.title} />
            <meta property="og:type" content="website" />
            <meta property="og:description" content={props.description} />
            <meta property="og:locale" content="nl_NL" />
            <meta property="og:site_name" content="ROOD" />
            <meta property="og:url" content={props.url} />
            <meta property="twitter:domain" content="roodjongeren.nl" />
            <meta property="twitter:url" content={props.url} />
            <meta name="twitter:title" content={props.title} />
            <meta name="twitter:description" content={props.description} />
            <meta name="twitter:card" content="summary_large_image" />
        </Head>
    );
}
