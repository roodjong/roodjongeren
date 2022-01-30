import {Post} from '../models/Post';
import Subheader from './Subheader';
import PostItem from './PostItem';

interface Props {
    posts: Post[];
}

export default function LatestNews(props: Props) {
    return <div className="content mt-4">
        <Subheader>Laatste nieuws</Subheader>
        <div className="flex flex-col gap-6 pb-4 mt-8">
            {props.posts.map(post => <PostItem key={post.slug} post={post}/>)}
        </div>
    </div>;
}