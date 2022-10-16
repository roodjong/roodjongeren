import Head from 'next/head';
import {fetchFallback, fetchPosts} from '../utils/backend';
import {Post} from '../models/Post';
import {StrapiPagination} from '../models/strapi';
import CollectionViewer from '../components/CollectionViewer';
import PostItem from '../components/PostItem';
import {GetStaticPropsContext, GetStaticPropsResult} from 'next';
import Banner from '../components/Banner';
import Main from '../components/Main';
import {revalidate} from '../utils/revalidate';
import Search from '../components/Search';
import {useCallback, useEffect, useState} from 'react';

const PAGE_SIZE = 8;

interface Props {
    pageBanner: string;
    posts: Post[];
    pagination: StrapiPagination;
}

export default function ActueelPage(props: Props) {
    const [posts, setPosts] = useState(props.posts);
    const [pagination, setPagination] = useState(props.pagination);
    const [isLoading, setLoading] = useState(false);
    const [searchString, setSearchString] = useState('');
    const [page, setPage] = useState(1);
    
    const handleSearch = useCallback((newSearchString: string) => {
        setPage(1);
        setSearchString(newSearchString);
    }, []);
    
    useEffect(() => {
        function retrievePosts() {
            setLoading(true);
            fetchPosts(null, null, null, page, PAGE_SIZE, null, searchString ?? null)
                .then(it => {
                    setPosts(it.posts);
                    setPagination(it.pagination);
                })
                .finally(() => {
                    setLoading(false);
                });
        }
        
        if (!searchString && page === 1) {
            setPosts(props.posts);
            setPagination(props.pagination);
        } else {
            retrievePosts();
        }
    }, [searchString, page, props]);
    
    return <div>
        <Head>
            <title>Actueel</title>
        </Head>
        <Banner title="Actueel" background={props.pageBanner} compact/>
        <Main className="container">
            <Search onChange={handleSearch} placeholder="Zoek op titel, auteur of inhoud" isLoading={isLoading}/>
            <CollectionViewer pagination={pagination} pageItems={posts.length} onChangePage={setPage}>
                <div className="flex flex-col gap-6 py-4">
                    {posts.map(post => <PostItem key={post.slug} post={post} showPostType/>)}
                </div>
            </CollectionViewer>
        </Main>
    </div>;
}

export async function getStaticProps(context: GetStaticPropsContext): Promise<GetStaticPropsResult<Props>> {
    const [{posts, pagination}, {pageBanner}] = await Promise.all([
        fetchPosts(null, null, null, 1, PAGE_SIZE),
        fetchFallback()
    ]);
    
    return {
        props: {pageBanner, posts, pagination},
        revalidate
    };
}