import { fetchAboutUs } from "../utils/backend";
import AboutUsContent from "../models/AboutUsContent";
import Markdown from "../components/Markdown";
import Banner from "../components/Banner";
import Main from "../components/Main";
import { GetStaticPropsResult } from "next";
import { revalidate } from "../utils/revalidate";
import HeadPage from "../components/HeadPage";

interface Props {
    content: AboutUsContent;
}

export default function OverOnsPage(props: Props) {
    return (
        <div>
            <HeadPage
                title="Over ons"
                description="Korte over-ons van ROOD, Socialistische Jongeren"
                url="https://roodjongeren.nl/afdelingen"
            />
            <Banner title="Over ons" background={props.content.banner} compact />
            <Main className="container">
                <Markdown content={props.content.content} />
            </Main>
        </div>
    );
}

export async function getStaticProps(): Promise<GetStaticPropsResult<Props>> {
    return {
        props: {
            content: await fetchAboutUs(),
        },
        revalidate,
    };
}
