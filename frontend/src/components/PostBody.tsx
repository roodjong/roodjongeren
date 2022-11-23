import Link from "next/link";
import { PostDetail, PostType } from "../models/Post";
import { dateToText } from "../utils/date";
import Main from "./Main";
import Markdown from "./Markdown";
import PostTypeDisplay from "./PostTypeDisplay";

interface Props {
    post: PostDetail;
    fallbackBanner: string;
}

export default function PostBody(props: Props) {
    const post = props.post;
    return <Main className="container">
        <p className="text-faded mb-4">
            <PostTypeDisplay type={props.post.type} />
            <span className="mx-2">&#xB7;</span>
            <span>
                <Link href={`/auteur/${encodeURIComponent(post.author)}`} >
                    <a className="hover:underline hover:text-primary transition-colors">
                        {post.author}
                    </a>
                </Link>
            </span>
            <span className="mx-2">&#xB7;</span>
            <span>{dateToText(new Date(post.publishedAt))}</span>
            {post.type === PostType.SUBMISSION && (
                <p className="mt-4">
                    <i>
                        Dit artikel is een ingezonden opiniestuk. De
                        opvattingen zijn daarmee geen officiële
                        standpunten van ROOD en sluiten niet
                        noodzakelijkerwijs aan op de meningen van al
                        onze leden.
                    </i>
                </p>
            )}
        </p>
        <Markdown content={post.content} />
    </Main>;
}
