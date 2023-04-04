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
    return (
        <Main className="container">
            <div className="text-faded mb-2">
                <p>
                    <PostTypeDisplay type={post.type} />
                    {dateToText(new Date(post.publishedAt))}
                </p>
                <Link
                    href={`/auteur/${encodeURIComponent(post.author)}`}
                    className="hover:underline hover:text-primary transition-colors"
                >
                    {post.author}
                </Link>
                {post.type === PostType.SUBMISSION && (
                    <p className="mt-4">
                        <i>
                            Dit artikel is een ingezonden opiniestuk. De opvattingen zijn
                            daarmee geen officiële standpunten van ROOD en sluiten niet
                            noodzakelijkerwijs aan op de meningen van al onze leden. Leden
                            kunnen opiniestukken indienen door een conceptversie te sturen
                            naar de redactie via{" "}
                            <a
                                className="text-primary underline hover:cursor-pointer"
                                href="mailto:redactie@roodjongeren.nl"
                            >
                                redactie@roodjongeren.nl
                            </a>
                            .
                        </i>
                    </p>
                )}
            </div>
            <Markdown content={post.content} />
        </Main>
    );
}
