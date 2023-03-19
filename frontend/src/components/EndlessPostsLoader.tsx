import { Post, PostType } from "../models/Post";
import PostItem from "./PostItem";
import { useState } from "react";
import { fetchPosts } from "../utils/backend";

interface Props {
    posts: Post[];
    postType: PostType | null;
    author: string | null;
    afdeling: string | null;
    frontpageOnly: boolean | null;
    className?: string;
}

EndlessPostsLoader.defaultProps = {
    postType: null,
    author: null,
    afdeling: null,
    frontpageOnly: null,
};

export default function EndlessPostsLoader(props: Props) {
    const [loading, setLoading] = useState(false);
    const [page, setPage] = useState(1);
    const [posts, setPosts] = useState<Post[]>(props.posts);
    const [reachedEnd, setReachedEnd] = useState(false);

    function loadMore() {
        setLoading(true);
        fetchPosts(
            props.postType,
            props.author,
            props.afdeling,
            page + 1,
            props.posts.length,
            null
        )
            .then(({ posts, pagination }) => {
                if (posts.length === 0) {
                    setReachedEnd(true);
                } else {
                    setPage(pagination.page);
                    setPosts((currentPosts) => currentPosts.concat(posts));
                }
            })
            .finally(() => setLoading(false));
    }

    return (
        <>
            <div className={props.className}>
                {posts.map((post) => (
                    <PostItem key={post.slug} post={post} />
                ))}
            </div>
            <div className="text-center mt-4">
                {posts.length === 0 ? (
                    <p className="text-faded">
                        <i>Nog geen nieuwsberichten</i>
                    </p>
                ) : reachedEnd ? (
                    <p className="text-faded">
                        <i>Geen nieuwsberichten meer</i>
                    </p>
                ) : (
                    <button
                        className="button-primary text-xl"
                        onClick={loading ? undefined : loadMore}
                    >
                        {loading ? "Laden.." : "Laad meer.."}
                    </button>
                )}
            </div>
        </>
    );
}
