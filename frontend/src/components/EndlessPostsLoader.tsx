import {Post} from '../models/Post';
import PostItem from './PostItem';
import {useState} from 'react';
import {fetchPosts} from '../utils/backend';

interface Props {
    posts: Post[];
    author: string | null;
    afdeling: string | null;
    pageSize: number;
    fallbackPostBanner: string;
}

EndlessPostsLoader.defaultProps = {
    author: null,
    afdeling: null,
    pageSize: 4
};

export default function EndlessPostsLoader(props: Props) {
    const [loading, setLoading] = useState(false);
    const [page, setPage] = useState(1);
    const [posts, setPosts] = useState<Post[]>(props.posts);
    const [reachedEnd, setReachedEnd] = useState(false);
    
    function loadMore() {
        setLoading(true);
        fetchPosts(undefined, props.author, props.afdeling, page + 1, props.pageSize).then(({posts, pagination}) => {
            if (posts.length === 0) {
                setReachedEnd(true);
            } else {
                setPage(pagination.page);
                setPosts(currentPosts => currentPosts.concat(posts));
            }
        }).finally(() => setLoading(false));
    }
    
    return <div className="flex flex-col gap-6 pb-4 mt-8">
        {posts.map(post => <PostItem key={post.slug} post={post} fallbackBanner={props.fallbackPostBanner}/>)}
        <div className="text-center">
            {posts.length === 0
                ? <p className="text-faded"><i>Nog geen nieuwsberichten</i></p>
                : reachedEnd
                    ? <p className="text-faded"><i>Geen nieuwsberichten meer</i></p>
                    : <button className="button-primary text-xl"
                              onClick={loading ? undefined : loadMore}>
                        {loading ? 'Laden..' : 'Laad meer..'}
                    </button>}
        </div>
    </div>;
}