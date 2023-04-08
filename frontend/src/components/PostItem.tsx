import Link from "next/link";
import Image from "next/image";
import { Post, PostType } from "../models/Post";
import { dateToText } from "../utils/date";
import imageLoader from "../utils/image-loader";
import { useRouter } from "next/router";
import { MouseEvent, useCallback } from "react";
import PostTypeDisplay from "./PostTypeDisplay";

interface Props {
    post: Post;
}

export default function PostItem(props: Props) {
    const post = props.post;
    const link =
        post.type == PostType.PETITION ? `/petitie/${post.slug}` : `/post/${post.slug}`;

    const router = useRouter();

    const handleAuthorClick = useCallback(
        (e: MouseEvent) => {
            e.stopPropagation();
            router.push(`/auteur/${encodeURIComponent(post.author)}`).then();
        },
        [router, post.author]
    );

    return (
        <Link href={link}>
            <div className="relative w-full h-[10rem] rounded overflow-hidden">
                {post.banner ? (
                    <Image
                        loader={imageLoader}
                        src={post.banner}
                        alt=""
                        fill
                        sizes="10rem"
                        className="object-cover"
                    />
                ) : (
                    <Image
                        src="/images/rood-logo.svg"
                        alt=""
                        fill
                        sizes="10rem"
                        className="object-contain opacity-10"
                    />
                )}
            </div>
            <div className="p-2">
                <h2 className="font-title text-2xl font-bold">{post.title}</h2>
                <p className="text-faded flex flex-col">
                    <span>
                        <PostTypeDisplay type={post.type} />
                        {dateToText(new Date(post.publishedAt))}
                    </span>
                    <span
                        className="hover:underline hover:text-primary transition-colors inline-block"
                        onClick={handleAuthorClick}
                    >
                        {post.author}
                    </span>
                </p>
            </div>
        </Link>
    );
}
