import { fetchAboutUs, fetchBoardmembers } from "../utils/backend";
import AboutUsContent from "../models/AboutUsContent";
import Markdown from "../components/Markdown";
import Banner from "../components/Banner";
import Main from "../components/Main";
import { GetStaticPropsResult } from "next";
import { revalidate } from "../utils/revalidate";
import HeadPage from "../components/HeadPage";
import BoardmemberCard from "../components/BoardmemberCard";
import { Boardmember } from "../models/Boardmember";

interface Props {
    content: AboutUsContent;
    boardmembers: Boardmember[];
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
                <div className="mb-8">
                    <Markdown content={props.content.content} />
                </div>
                {props.boardmembers.map((boardmember) => (
                    <BoardmemberCard key={boardmember.name} boardmember={boardmember} />
                ))}
            </Main>
        </div>
    );
}

export async function getStaticProps(): Promise<GetStaticPropsResult<Props>> {
    const [content, boardmembers] = await Promise.all([
        fetchAboutUs(),
        fetchBoardmembers(),
    ]);

    return {
        props: { content, boardmembers },
        revalidate,
    };
}
