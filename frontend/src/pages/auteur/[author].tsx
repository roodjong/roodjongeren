import Head from 'next/head';
import {fetchAuthors, fetchFallback, fetchPosts} from '../../utils/backend';
import {Post} from '../../models/Post';
import {GetStaticPathsResult, GetStaticPropsContext, GetStaticPropsResult} from 'next';
import {ParsedUrlQuery} from 'querystring';
import Banner from '../../components/Banner';
import Main from '../../components/Main';
import {revalidate} from '../../utils/revalidate';
import EndlessPostsLoader from '../../components/EndlessPostsLoader';

interface Params extends ParsedUrlQuery {
    author: string;
}

interface Props {
    pageBanner: string;
    fallbackPostBanner: string;
    posts: Post[];
    author: string;
}

export default function NieuwsAuthorPage(props: Props) {
    return <div>
        <Head>
            <title>{props.author} - Nieuws & Opiniestukken</title>
        </Head>
        <Banner title={props.author} subtitle="Nieuws & Inzendingen" background={props.pageBanner} compact/>
        <Main className="container">
            <EndlessPostsLoader posts={props.posts} author={props.author} fallbackPostBanner={props.fallbackPostBanner}/>
        </Main>
    </div>;
}

export async function getStaticPaths(): Promise<GetStaticPathsResult> {
    const authors = await fetchAuthors();
    const paths = authors.flatMap(author => ({params: {author}}));
    
    return {
        paths,
        fallback: 'blocking'
    };
}

export async function getStaticProps(context: GetStaticPropsContext): Promise<GetStaticPropsResult<Props>> {
    const params = context.params as Params;
    const author = params.author;
    
    const [{posts}, {pageBanner, postBanner}] = await Promise.all([
        fetchPosts(undefined, author, null, 1, 4),
        fetchFallback()
    ]);
    
    return {
        props: {pageBanner, posts, author, fallbackPostBanner: postBanner},
        revalidate
    };
}