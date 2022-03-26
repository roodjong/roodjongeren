import Head from 'next/head';
import {fetchFallbackBanner, fetchPosts} from '../../../utils/backend';
import {Post} from '../../../models/Post';
import {StrapiPagination} from '../../../models/strapi';
import CollectionViewer from '../../../components/CollectionViewer';
import PostItem from '../../../components/PostItem';
import {GetStaticPathsResult, GetStaticPropsContext, GetStaticPropsResult} from 'next';
import {ParsedUrlQuery} from 'querystring';
import Banner from '../../../components/Banner';
import Main from '../../../components/Main';
import {revalidate} from '../../../utils/revalidate';

interface Params extends ParsedUrlQuery {
    page: string;
}

interface Props {
    banner: string;
    posts: Post[];
    pagination: StrapiPagination;
}

export default function NieuwsPage(props: Props) {
    return <div>
        <Head>
            <title>Nieuws</title>
        </Head>
        <Banner title="Nieuws" background={props.banner} compact/>
        <Main className="content">
            <CollectionViewer pagination={props.pagination} pageItems={props.posts.length} urlPrefix="/nieuws/page/">
                <div className="flex flex-col gap-6 pb-4">
                    {props.posts.map(post => <PostItem key={post.slug} post={post}/>)}
                </div>
            </CollectionViewer>
        </Main>
    </div>;
}

export async function getStaticPaths(): Promise<GetStaticPathsResult> {
    const {pagination} = await fetchPosts();
    const paths = [...Array(pagination.pageCount).keys()].map((pageIndex: number) => ({
        params: {
            page: (pageIndex + 1).toString()
        }
    }));
    
    return {
        paths,
        fallback: 'blocking'
    };
}

export async function getStaticProps(context: GetStaticPropsContext): Promise<GetStaticPropsResult<Props>> {
    const params = context.params as Params;
    const page = parseInt(params.page);
    
    const [{posts, pagination}, banner] = await Promise.all([
        fetchPosts(null, page),
        fetchFallbackBanner()
    ]);
    
    return {
        props: {banner, posts, pagination},
        revalidate
    };
}