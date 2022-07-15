import Head from 'next/head';
import {fetchFallback, fetchPosts} from '../../utils/backend';
import {Post, PostType} from '../../models/Post';
import {StrapiPagination} from '../../models/strapi';
import CollectionViewer from '../../components/CollectionViewer';
import PostItem from '../../components/PostItem';
import {GetStaticPathsResult, GetStaticPropsContext, GetStaticPropsResult} from 'next';
import {ParsedUrlQuery} from 'querystring';
import Banner from '../../components/Banner';
import Main from '../../components/Main';
import {revalidate} from '../../utils/revalidate';

const PAGE_SIZE = 8;

interface Params extends ParsedUrlQuery {
    page: string;
}

interface Props {
    pageBanner: string;
    fallbackPostBanner: string;
    submissions: Post[];
    pagination: StrapiPagination;
}

export default function InzendingenPage(props: Props) {
    return <div>
        <Head>
            <title>Inzendingen</title>
        </Head>
        <Banner title="Inzendingen" background={props.pageBanner} compact/>
        <Main className="container">
            <CollectionViewer pagination={props.pagination} pageItems={props.submissions.length} urlPrefix="/inzendingen/">
                <div className="flex flex-col gap-6 pb-4">
                    {props.submissions.map(post => <PostItem key={post.slug} post={post} fallbackBanner={props.fallbackPostBanner}/>)}
                </div>
            </CollectionViewer>
        </Main>
    </div>;
}

export async function getStaticPaths(): Promise<GetStaticPathsResult> {
    const {pagination} = await fetchPosts(PostType.SUBMISSION, null, null, 0, PAGE_SIZE);
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
    
    const [{posts, pagination}, {pageBanner, postBanner}] = await Promise.all([
        fetchPosts(PostType.SUBMISSION, null, null, page, 8),
        fetchFallback()
    ]);
    
    return {
        props: {pageBanner, fallbackPostBanner: postBanner, submissions: posts, pagination},
        revalidate
    };
}