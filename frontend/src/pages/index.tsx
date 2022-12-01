import Banner from "../components/Banner";
import AboutUsShort from "../components/AboutUsShort";
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
import AfdelingenTable from "../components/AfdelingenTable";

interface Props {
    homeContent: HomeContent;
    afdelingen: Afdeling[];
    latestNews: Post[];
    latestSubmissions: Post[];
}

export default function HomePage(props: Props) {
    const content = props.homeContent;

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
                <div className="md:max-w-screen-xl mx-auto flex flex-col md:flex-row gap-4">
                    <div className="md:basis-8/12">
                        <object
                            data="/images/roodnederland.svg"
                            type="image/svg+xml"
                        />
                    </div>
                    <div className="md:basis-4/12">
                        <AfdelingenTable afdelingen={props.afdelingen} />
                    </div>
                </div>
                <div className="container flex sm:flex-row flex-col gap-8 mt-4">
                    <div className="basis-2/3">
                        <Subheader>Laatste nieuws</Subheader>
                        <EndlessPostsLoader
                            postType={PostType.NEWS}
                            posts={props.latestNews}
                        />
                    </div>
                    <div className="basis-1/3">
                        <Subheader>Laatste inzendingen</Subheader>
                        <EndlessPostsLoader
                            postType={PostType.SUBMISSION}
                            posts={props.latestSubmissions}
                        />
                    </div>
                </div>
                <div className="basis-1/3">
                    <Subheader>Laatste inzendingen</Subheader>
                    <EndlessPostsLoader
                        postType={PostType.SUBMISSION}
                        posts={props.latestSubmissions}
                    />
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
