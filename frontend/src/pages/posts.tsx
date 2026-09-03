import { fetchFallback, fetchPosts } from "../utils/backend";
import { Post } from "../models/Post";
import { StrapiPagination } from "../models/strapi";
import CollectionViewer from "../components/CollectionViewer";
import PostItem from "../components/PostItem";
import { GetStaticPropsContext, GetStaticPropsResult } from "next";
import Banner from "../components/Banner";
import Main from "../components/Main";
import { revalidate } from "../utils/revalidate";
import Search from "../components/Search";
import { useCallback, useEffect, useState } from "react";
import HeadPage from "../components/HeadPage";
import { useRouter } from "next/router";
import { ParsedUrlQuery } from "querystring";

const PAGE_SIZE = 16;

interface Props {
    pageBanner: string;
    posts: Post[];
    pagination: StrapiPagination;
}

interface SearchState {
    searchString: string;
    page: number;
}

function parsePage(value: string | string[] | undefined): number {
    if (typeof value !== "string" || !/^[1-9]\d*$/.test(value)) {
        return 1;
    }

    const page = Number(value);
    return Number.isSafeInteger(page) ? page : 1;
}

function getSearchState(query: ParsedUrlQuery): SearchState {
    return {
        searchString: typeof query.search === "string" ? query.search.trim() : "",
        page: parsePage(query.page),
    };
}

function createQuery(
    currentQuery: ParsedUrlQuery,
    searchString: string,
    page: number
): ParsedUrlQuery {
    const query = { ...currentQuery };
    delete query.search;
    delete query.page;

    if (searchString) {
        query.search = searchString;
    }
    if (page > 1) {
        query.page = String(page);
    }

    return query;
}

export default function PostsPage(props: Props) {
    const router = useRouter();
    const [posts, setPosts] = useState(props.posts);
    const [pagination, setPagination] = useState(props.pagination);
    const [isLoading, setLoading] = useState(false);
    const { searchString, page } = router.isReady
        ? getSearchState(router.query)
        : { searchString: "", page: 1 };

    const syncQuery = useCallback(
        (nextSearchString: string, nextPage: number, addHistoryEntry = false) => {
            const url = {
                pathname: router.pathname,
                query: createQuery(router.query, nextSearchString, nextPage),
            };
            const options = { shallow: true, scroll: false };

            if (addHistoryEntry) {
                void router.push(url, undefined, options);
            } else {
                void router.replace(url, undefined, options);
            }
        },
        [router]
    );

    useEffect(() => {
        if (!router.isReady) {
            return;
        }

        const rawSearch =
            typeof router.query.search === "string" ? router.query.search : "";
        const rawPage = typeof router.query.page === "string" ? router.query.page : "";
        const canonicalPage = page > 1 ? String(page) : "";
        if (rawSearch !== searchString || rawPage !== canonicalPage) {
            syncQuery(searchString, page);
        }
    }, [page, router.isReady, router.query, searchString, syncQuery]);

    const handleSearch = useCallback(
        (newSearchString: string) => {
            const normalizedSearchString = newSearchString.trim();
            syncQuery(normalizedSearchString, 1);
        },
        [syncQuery]
    );

    const handlePageChange = useCallback(
        (nextPage: number) => {
            syncQuery(searchString, nextPage, true);
        },
        [searchString, syncQuery]
    );

    useEffect(() => {
        if (!router.isReady) {
            return;
        }

        let cancelled = false;

        function retrievePosts() {
            setLoading(true);
            fetchPosts(null, null, null, page, PAGE_SIZE, null, searchString ?? null)
                .then((it) => {
                    if (cancelled) {
                        return;
                    }

                    const lastPage = Math.max(it.pagination.pageCount, 1);
                    if (page > lastPage) {
                        syncQuery(searchString, 1);
                        return;
                    }

                    setPosts(it.posts);
                    setPagination(it.pagination);
                })
                .finally(() => {
                    if (!cancelled) {
                        setLoading(false);
                    }
                });
        }

        if (!searchString && page === 1) {
            setLoading(false);
            setPosts(props.posts);
            setPagination(props.pagination);
        } else {
            retrievePosts();
        }

        return () => {
            cancelled = true;
        };
    }, [page, props.pagination, props.posts, router.isReady, searchString, syncQuery]);

    return (
        <div>
            <HeadPage
                title="Posts"
                description="Overzicht van alle nieuwsberichten en inzendingen van ROOD"
                url="https://roodjongeren.nl/posts"
            />
            <Banner title="Posts" background={props.pageBanner} compact />
            <Main className="container">
                <Search
                    value={searchString}
                    onChange={handleSearch}
                    placeholder="Zoek op titel, auteur of inhoud"
                    isLoading={isLoading}
                />
                <CollectionViewer
                    pagination={pagination}
                    pageItems={posts.length}
                    onChangePage={handlePageChange}
                >
                    <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-x-4 gap-y-8">
                        {posts.map((post) => (
                            <PostItem key={post.slug} post={post} />
                        ))}
                    </div>
                </CollectionViewer>
            </Main>
        </div>
    );
}

export async function getStaticProps(
    context: GetStaticPropsContext
): Promise<GetStaticPropsResult<Props>> {
    const [{ posts, pagination }, { pageBanner }] = await Promise.all([
        fetchPosts(null, null, null, 1, PAGE_SIZE),
        fetchFallback(),
    ]);

    return {
        props: { pageBanner, posts, pagination },
        revalidate,
    };
}
