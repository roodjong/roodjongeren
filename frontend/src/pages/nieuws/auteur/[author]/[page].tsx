import Head from 'next/head';
import {fetchAuthors, fetchFallbackBanner, fetchPosts} from '../../../../utils/backend';
import {Post} from '../../../../models/Post';
import {StrapiPagination} from '../../../../models/strapi';
import CollectionViewer from '../../../../components/CollectionViewer';
import PostItem from '../../../../components/PostItem';
import {GetStaticPathsResult, GetStaticPropsContext, GetStaticPropsResult} from 'next';
import {ParsedUrlQuery} from 'querystring';
import Banner from '../../../../components/Banner';
import Main from '../../../../components/Main';
import {revalidate} from '../../../../utils/revalidate';

interface Params extends ParsedUrlQuery {
    author: string;
    page: string;
}

interface Props {
    banner: string;
    posts: Post[];
    pagination: StrapiPagination;
    author: string;
}

export default function NieuwsAuthorPage(props: Props) {
    return <div>
        <Head>
            <title>Nieuws - {props.author}</title>
        </Head>
        <Banner title="Nieuws" subtitle={props.author} background={props.banner} compact/>
        <Main className="content">
            <CollectionViewer pagination={props.pagination} pageItems={props.posts.length} urlPrefix={`/nieuws/auteur/${props.author}/`}>
                <div className="flex flex-col gap-6 pb-4">
                    {props.posts.map(post => <PostItem key={post.slug} post={post}/>)}
                </div>
            </CollectionViewer>
        </Main>
    </div>;
}

export async function getStaticPaths(): Promise<GetStaticPathsResult> {
    const authors = await fetchAuthors();
    const paths = authors.flatMap(async author => {
        const {pagination} = await fetchPosts(author);
        
        return [...Array(pagination.pageCount).keys()].flatMap((pageIndex: number) => ({
            params: {
                author,
                page: (pageIndex + 1).toString()
            }
        }));
    });
    
    return {
        paths: (await Promise.all(paths)).flat(),
        fallback: 'blocking'
    };
}

export async function getStaticProps(context: GetStaticPropsContext): Promise<GetStaticPropsResult<Props>> {
    const params = context.params as Params;
    const author = params.author;
    const page = parseInt(params.page);
    
    const [{posts, pagination}, banner] = await Promise.all([
        fetchPosts(author, page),
        fetchFallbackBanner()
    ]);
    
    return {
        props: {banner, posts, pagination, author},
        revalidate
    };
}