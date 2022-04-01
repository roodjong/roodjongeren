import Head from 'next/head';
import {ParsedUrlQuery} from 'querystring';
import {GetStaticPathsResult, GetStaticPropsContext} from 'next';
import {PostDetail, PostType} from '../../../models/Post';
import {fetchFallbackBanner, fetchPost, fetchPostSlugs} from '../../../utils/backend';
import Markdown from '../../../components/Markdown';
import {dateToText} from '../../../utils/date';
import Banner from '../../../components/Banner';
import Main from '../../../components/Main';
import Link from 'next/link';

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
                <span>
                    <Link href={`/nieuws/auteur/${post.author}`}>
                        <a className="hover:underline hover:text-primary transition-colors">
                            {post.author}
                        </a>
                    </Link>
                </span>
                <span className="mx-2">&#xB7;</span>
                <span>{dateToText(new Date(post.publishedAt))}</span>
                {post.type === PostType.SUBMISSION &&
                    <p className="mt-4">
                        <i>
                            Dit artikel is een ingezonden opiniestuk. De opvattingen zijn daarmee geen officiële standpunten van ROOD en sluiten niet
                            noodzakelijkerwijs aan op de meningen van al onze leden.
                        </i>
                    </p>}
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