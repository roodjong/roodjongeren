import Markdown from "../components/Markdown";
import Banner from "../components/Banner";
import Main from "../components/Main";
import { GetStaticPropsResult } from "next";
import { revalidate } from "../utils/revalidate";
import { fetchInternational } from "../utils/backend";
import InternationalContent from "../models/InternationalContent";
import HeadPage from "../components/HeadPage";

interface Props {
    content: InternationalContent;
}

export default function InternationalPage(props: Props) {
    return (
        <div>
            <HeadPage
                title="International"
                description="Informatie over ROOD's internationale werk en samenwerking"
                url="https://roodjongeren.nl/international"
            />
            <Banner title="International" background={props.content.banner} compact />
            <Main className="container">
                <Markdown content={props.content.content} />
            </Main>
        </div>
    );
}

export async function getStaticProps(): Promise<GetStaticPropsResult<Props>> {
    return {
        props: {
            content: await fetchInternational(),
        },
        revalidate,
    };
}
