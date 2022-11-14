import {ParsedUrlQuery} from 'querystring';
import {GetStaticPathsResult, GetStaticPropsContext} from 'next';
import {PostDetail, PostType} from '../../models/Post';
import {fetchFallback, fetchPost, fetchPostSlugs} from '../../utils/backend';
import Markdown from '../../components/Markdown';
import {dateToText} from '../../utils/date';
import Banner from '../../components/Banner';
import Main from '../../components/Main';
import Link from 'next/link';
import PostTypeDisplay from '../../components/PostTypeDisplay';
import {revalidate} from '../../utils/revalidate';
import HeadArticle from '../../components/HeadArticle';

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
        <HeadArticle post={post}/>
        <Banner title={post.title}
                subtitle={<>
                    {post.author}
                    <span className="mx-2">&#xB7;</span>
                    {dateToText(new Date(post.publishedAt))}
                </>}
                background={post.banner ?? props.fallbackBanner}
                compact/>
        <Main className="container">
            <p className="text-faded mb-4">
                <PostTypeDisplay type={props.post.type}/>
                <span className="mx-2">&#xB7;</span>
                <span>
                    <Link href={`/auteur/${encodeURIComponent(post.author)}`}>
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
                            Leden kunnen opiniestukken indienen door een conceptversie te sturen naar de redactie via <a class="text-primary underline hover:cursor-pointer" href="mailto:redactie@roodjongeren.nl>redactie@roodjongeren.nl</a>.
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
    
    const [post, {pageBanner}] = await Promise.all([
        fetchPost(params.slug),
        fetchFallback()
    ]);
    
    return {
        props: {post, fallbackBanner: pageBanner},
        revalidate
    };
}
