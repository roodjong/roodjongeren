import Banner from "../components/Banner";
import AboutUsShort from "../components/AboutUsShort";
import dynamic from "next/dynamic";
import { useMemo } from "react";
import { fetchAfdelingen, fetchHome, fetchPosts } from "../utils/backend";
import Afdeling from "../models/Afdeling";
import HomeContent from "../models/HomeContent";
import { Post, PostType } from "../models/Post";
import Main from "../components/Main";
import { revalidate } from "../utils/revalidate";
import { GetStaticPropsResult } from "next";
import Subheader from "../components/Subheader";
import EndlessPostsLoader from "../components/EndlessPostsLoader";
import HeadPage from "../components/HeadPage";

interface Props {
    homeContent: HomeContent;
    afdelingen: Afdeling[];
    latestNews: Post[];
    latestSubmissions: Post[];
}

export default function HomePage(props: Props) {
    const content = props.homeContent;
    const AfdelingenMap = useMemo(
        () =>
            dynamic(() => import("../components/AfdelingenMap"), {
                ssr: false,
            }),
        []
    );

    return (
        <div>
            <HeadPage
                title="ROOD, Socialistische Jongeren"
                description="Politieke organisatie voor socialistische of anderzijds linkse jongeren"
                url="https://roodjongeren.nl/"
            />
            <Banner
                title={content.bannerTitle}
                subtitle={content.bannerSubtitle}
                background={content.banner}
            />
            <Main>
                <AboutUsShort content={content.shortAboutUs} />
                <AfdelingenMap afdelingen={props.afdelingen} compact />
                <div className="container flex sm:flex-row flex-col gap-8 mt-4">
                    <div className="basis-2/3">
                        <Subheader>Laatste nieuws</Subheader>
                        <EndlessPostsLoader
                            postType={PostType.NEWS}
                            posts={props.latestNews}
                            className="mt-4 grid grid-cols-1 md:grid-cols-2 xl:grid-cols-3 gap-x-4 gap-y-8"
                        />
                    </div>
                    <div className="basis-1/3">
                        <Subheader>Laatste inzendingen</Subheader>
                        <EndlessPostsLoader
                            postType={PostType.SUBMISSION}
                            posts={props.latestSubmissions}
                            className="mt-4 grid grid-cols-1 gap-x-4 gap-y-8"
                        />
                    </div>
                </div>
            </Main>
        </div>
    );
}

export async function getStaticProps(): Promise<GetStaticPropsResult<Props>> {
    const [homeContent, afdelingen, news, submissions] = await Promise.all([
        fetchHome(),
        fetchAfdelingen(),
        fetchPosts(PostType.NEWS, null, null, 1, 6, true),
        fetchPosts(PostType.SUBMISSION, null, null, 1, 6, true),
    ]);

    return {
        props: {
            homeContent,
            afdelingen,
            latestNews: news.posts,
            latestSubmissions: submissions.posts,
        },
        revalidate,
    };
}
