import Link from 'next/link';
import Image from 'next/image';
import {Post, PostType} from '../models/Post';
import {dateToText} from '../utils/date';
import imageLoader from '../utils/image-loader';
import {useRouter} from 'next/router';
import {useCallback} from 'react';
import PostTypeDisplay from './PostTypeDisplay';

interface Props {
    post: Post;
    showPostType?: boolean;
}

export default function PostItem(props: Props) {
    const post = props.post;
    const link = post.type == PostType.PETITION ? `/petitie/${post.slug}` : `/post/${post.slug}`;

    const router = useRouter();

    const handleClick = useCallback(() => {
        router.push(link).then();
    }, [router, link]);

    const stopPropagation = useCallback(e => e.stopPropagation(), []);

    return <div onClick={handleClick}
                className="shadow shadow-[#0004] bg-gray-50 hover:shadow-lg hover:shadow-[#0004] transition-shadow rounded flex flex-col md:flex-row items-stretch cursor-pointer">
        <div className={`p-4 flex flex-col basis-2/3 gap-4 justify-between items-start ${post.banner ? 'basis-2/3' : 'basis-full'}`}>
            <div>
                <h1 className="font-title text-3xl font-bold">{post.title}</h1>
                <p className="text-faded">
                    {props.showPostType && <>
                        <PostTypeDisplay type={post.type}/>
                        <span className="mx-2">&#xB7;</span>
                    </>}
                    <span>
                            <Link href={`/auteur/${encodeURIComponent(post.author)}`}>
                                <a className="hover:underline hover:text-primary transition-colors" onClick={stopPropagation}>
                                    {post.author}
                                </a>
                            </Link>
                        </span>
                    <span className="mx-2">&#xB7;</span>
                    <span>{dateToText(new Date(post.publishedAt))}</span>
                </p>
            </div>
        </div>
        {post.banner &&
            <div className="relative basis-1/3 min-h-[12rem] md:min-h-0">
                <Image loader={imageLoader}
                       src={post.banner}
                       alt="Artikel-banner"
                       objectFit={post.banner ? 'cover' : 'scale-down'}
                       objectPosition="center"
                       layout="fill"/>
            </div>
        }
    </div>;
}
