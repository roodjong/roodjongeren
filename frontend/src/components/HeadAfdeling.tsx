import joinPaths from "../utils/paths";
import Head from "next/head";
import AfdelingDetail from "../models/Afdeling";

const DESCRIPTION_LENGTH = 160;

interface Props {
    afdeling: AfdelingDetail;
}

export default function HeadAfdeling({ afdeling }: Props) {
    let description = afdeling.about.slice(
        0,
        Math.min(DESCRIPTION_LENGTH, afdeling.about.length)
    );
    if (afdeling.about.length > description.length) {
        description = description + "...";
    }
    const url = joinPaths("https://roodjongeren.nl/afdeling/", afdeling.slug);
    const image = joinPaths("https://roodjongeren.nl/backend/", afdeling.banner ?? "");

    return (
        <Head>
            <title>{afdeling.name}</title>
            <meta name="description" content={description} />
            <meta property="og:title" content={afdeling.name} />
            <meta property="og:type" content="article" />
            <meta property="og:description" content={description} />
            <meta property="og:locale" content="nl_NL" />
            <meta property="og:site_name" content="ROOD" />
            <meta property="og:url" content={url} />
            <meta property="twitter:domain" content="roodjongeren.nl" />
            <meta property="twitter:url" content={url} />
            <meta name="twitter:title" content={afdeling.name} />
            <meta name="twitter:description" content={description} />
            <meta name="twitter:card" content="summary_large_image" />
            {afdeling.banner && (
                <>
                    <meta property="og:image" content={image} />
                    <meta name="twitter:image" content={image} />
                </>
            )}
        </Head>
    );
}
