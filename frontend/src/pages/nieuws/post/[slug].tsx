import Head from 'next/head';
import {ParsedUrlQuery} from 'querystring';
import {GetStaticPathsResult, GetStaticPropsContext} from 'next';
import {PostDetail} from '../../../models/Post';
import {fetchFallbackBanner, fetchPost, fetchPostSlugs} from '../../../utils/backend';
import Markdown from '../../../components/Markdown';
import {dateToText} from '../../../utils/date';
import Banner from '../../../components/Banner';
import Main from '../../../components/Main';

interface Params extends ParsedUrlQuery {
    slug: string;
}

interface Props {
    post: PostDetail;
    fallbackBanner: string;
}

export default function PostPage(props: Props) {
    const post = props.post;
    
    return <div>
        <Head>
            <title>{post.title}</title>
        </Head>
        <Banner title={post.title}
                subtitle={<>
                    {post.author}
                    <span className="mx-2">&#xB7;</span>
                    {dateToText(new Date(post.publishedAt))}
                </>}
                background={post.banner ?? props.fallbackBanner}
                compact/>
        <Main className="content">
            <p className="text-faded mb-4">
                <span>{post.author}</span>
                <span className="mx-2">&#xB7;</span>
                <span>{dateToText(new Date(post.publishedAt))}</span>
            </p>
            <Markdown content={post.content}/>
        </Main>
    </div>;
}

export async function getStaticPaths(): Promise<GetStaticPathsResult> {
    const {slugs} = await fetchPostSlugs();
    
    const paths = slugs.map(slug => ({
        params: {slug}
    }));
    
    return {
        paths,
        fallback: 'blocking'
    };
}

export async function getStaticProps(context: GetStaticPropsContext) {
    const params = context.params as Params;
    
    const [post, fallbackBanner] = await Promise.all([
        fetchPost(params.slug),
        fetchFallbackBanner()
    ]);
    
    return {
        props: {post, fallbackBanner}
    };
}