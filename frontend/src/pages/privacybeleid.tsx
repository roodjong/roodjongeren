import { fetchFallback, fetchPrivacybeleid } from "../utils/backend";
import PrivacybeleidContent from "../models/PrivacybeleidContent";
import Markdown from "../components/Markdown";
import Banner from "../components/Banner";
import Main from "../components/Main";
import { revalidate } from "../utils/revalidate";
import { GetStaticPropsResult } from "next";
import HeadPage from "../components/HeadPage";

interface Props {
    pageBanner: string;
    privacybeleid: PrivacybeleidContent;
}

export default function PrivacybeleidPage(props: Props) {
    return (
        <div>
            <HeadPage
                title="Privacybeleid"
                description="Het privacybeleid dat ROOD hanteert"
                url="https://roodjongeren.nl/privacybeleid"
            />
            <Banner title="Privacybeleid" background={props.pageBanner} compact />
            <Main className="container">
                <Markdown content={props.privacybeleid.content} />
            </Main>
        </div>
    );
}

export async function getStaticProps(): Promise<GetStaticPropsResult<Props>> {
    const [{ pageBanner }, privacybeleid] = await Promise.all([
        fetchFallback(),
        fetchPrivacybeleid(),
    ]);

    return {
        props: { pageBanner, privacybeleid },
        revalidate,
    };
}
