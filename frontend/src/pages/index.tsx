import Head from 'next/head';
import Banner from '../components/Banner';
import AboutUsShort from '../components/AboutUsShort';
import dynamic from 'next/dynamic';
import {useMemo} from 'react';
import {fetchAfdelingen, fetchFallback, fetchHome, fetchPosts} from '../utils/backend';
import Afdeling from '../models/Afdeling';
import HomeContent from '../models/HomeContent';
import {Post} from '../models/Post';
import Main from '../components/Main';
import {revalidate} from '../utils/revalidate';
import {GetStaticPropsResult} from 'next';
import Subheader from '../components/Subheader';
import EndlessPostsLoader from '../components/EndlessPostsLoader';

interface Props {
    homeContent: HomeContent;
    afdelingen: Afdeling[];
    posts: Post[];
    fallbackPostBanner: string;
}

export default function HomePage(props: Props) {
    const content = props.homeContent;
    const AfdelingenMap = useMemo(() => dynamic(() => import('../components/AfdelingenMap'), {ssr: false}), []);
    
    return <div>
        <Head>
            <title>ROOD, Socialistische Jongeren</title>
        </Head>
        <Banner title={content.bannerTitle} subtitle={content.bannerSubtitle} background={content.banner}/>
        <Main>
            <AboutUsShort content={content.shortAboutUs}/>
            <AfdelingenMap afdelingen={props.afdelingen} compact/>
            <div className="container">
                <Subheader>Laatste nieuws & inzendingen</Subheader>
                <EndlessPostsLoader posts={props.posts} fallbackPostBanner={props.fallbackPostBanner}/>
            </div>
        </Main>
    </div>;
}

export async function getStaticProps(): Promise<GetStaticPropsResult<Props>> {
    const [homeContent, afdelingen, {posts}, {postBanner}] = await Promise.all([
        fetchHome(),
        fetchAfdelingen(),
        fetchPosts(undefined, null, null, 1, 4),
        fetchFallback()
    ]);
    
    return {
        props: {homeContent, afdelingen, posts, fallbackPostBanner: postBanner},
        revalidate
    };
}