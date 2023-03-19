import { fetchJoinUs } from "../utils/backend";
import Markdown from "../components/Markdown";
import JoinUsContent from "../models/JoinUsContent";
import { FaFistRaised, FaHandHoldingHeart } from "react-icons/fa";
import Link from "next/link";
import Banner from "../components/Banner";
import Main from "../components/Main";
import { GetStaticPropsResult } from "next";
import { revalidate } from "../utils/revalidate";
import HeadPage from "../components/HeadPage";

interface Props {
    content: JoinUsContent;
}

export default function JoinUsPage(props: Props) {
    return (
        <div>
            <HeadPage
                title="Word lid"
                description="Actief worden in de grootste socialistische jongerenorganisatie van Nederland"
                url="https://roodjongeren.nl/word-lid"
            />
            <Banner title="Word lid" background={props.content.banner} compact />
            <Main className="container">
                <Markdown content={props.content.content} />
                <div className="flex flex-col sm:flex-row gap-4">
                    <a
                        className="button-primary inline-block text-3xl umami--click--word-lid"
                        href="https://mijn.roodjongeren.nl/aanmelden"
                    >
                        Lid worden <FaFistRaised className="inline align-baseline ml-2" />
                    </a>
                    <a
                        className="button-primary inline-block text-3xl umami--click--steunlid-worden"
                        href="https://mijn.roodjongeren.nl/steunlid-worden"
                    >
                        Steunlid worden{" "}
                        <FaHandHoldingHeart className="inline align-baseline ml-2" />
                    </a>
                </div>
            </Main>
        </div>
    );
}

export async function getStaticProps(): Promise<GetStaticPropsResult<Props>> {
    return {
        props: {
            content: await fetchJoinUs(),
        },
        revalidate,
    };
}
