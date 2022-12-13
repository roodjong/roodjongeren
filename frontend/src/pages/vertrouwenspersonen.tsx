import { fetchConfidants, fetchConfidantsPage } from "../utils/backend";
import { Confidant } from "../models/Confidant";
import Markdown from "../components/Markdown";
import ConfidantsPageContent from "../models/ConfidantsPageContent";
import ConfidantCard from "../components/ConfidantCard";
import Banner from "../components/Banner";
import Main from "../components/Main";
import { GetStaticPropsResult } from "next";
import { revalidate } from "../utils/revalidate";
import HeadPage from "../components/HeadPage";

interface Props {
    content: ConfidantsPageContent;
    confidants: Confidant[];
}

export default function VertrouwenspersonenPage(props: Props) {
    return (
        <div>
            <HeadPage
                title="Vertrouwenspersonen"
                description="Bij wie je terecht kan als je tegen problemen aanloopt in ROOD"
                url="https://roodjongeren.nl/vertrouwenspersonen"
            />
            <Banner
                title="Vertrouwens&shy;personen"
                background={props.content.banner}
                compact
            />
            <Main className="container">
                <div className="mb-8">
                    <Markdown content={props.content.content} />
                </div>
                {props.confidants.map((confidant) => (
                    <ConfidantCard key={confidant.name} confidant={confidant} />
                ))}
            </Main>
        </div>
    );
}

export async function getStaticProps(): Promise<GetStaticPropsResult<Props>> {
    const [content, confidants] = await Promise.all([
        fetchConfidantsPage(),
        fetchConfidants(),
    ]);

    return {
        props: { content, confidants },
        revalidate,
    };
}
