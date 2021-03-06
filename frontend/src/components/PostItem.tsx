import Link from 'next/link';
import Image from 'next/image';
import {Post} from '../models/Post';
import {dateToText} from '../utils/date';
import imageLoader from '../utils/image-loader';
import {useRouter} from 'next/router';
import {useCallback} from 'react';
import PostTypeDisplay from './PostTypeDisplay';

interface Props {
    post: Post;
    fallbackBanner: string;
}

export default function PostItem(props: Props) {
    const post = props.post;
    const link = `/post/${post.slug}`;
    
    const router = useRouter();
    
    const handleClick = useCallback(() => {
        router.push(link).then();
    }, [router, link]);
    
    const stopPropagation = useCallback(e => e.stopPropagation(), []);
    
    return <div onClick={handleClick}
                className="shadow shadow-[#0004] bg-gray-50 hover:shadow-lg hover:shadow-[#0004] transition-shadow rounded flex flex-col md:flex-row items-stretch cursor-pointer">
        <div className="p-4 basis-1/2 flex flex-col gap-4 justify-between items-start">
            <div>
                <h1 className="font-title text-3xl font-bold">{post.title}</h1>
                <p className="text-faded">
                    <PostTypeDisplay type={props.post.type}/>
                    <span className="mx-2">&#xB7;</span>
                    <span>
                            <Link href={`/auteur/${post.author}`}>
                                <a className="hover:underline hover:text-primary transition-colors" onClick={stopPropagation}>
                                    {post.author}
                                </a>
                            </Link>
                        </span>
                    <span className="mx-2">&#xB7;</span>
                    <span>{dateToText(new Date(post.publishedAt))}</span>
                </p>
            </div>
            <Link href={link}>
                <a className="button-primary text-xl inline-block px-4 py-2"
                   tabIndex={-1}>
                    Lees meer
                </a>
            </Link>
        </div>
        <div className="relative basis-1/2 min-h-[12rem] md:min-h-0">
            <Image loader={imageLoader}
                   src={post.banner ?? props.fallbackBanner}
                   alt="Artikel-banner"
                   objectFit={post.banner ? 'cover' : 'scale-down'}
                   objectPosition="center"
                   layout="fill"/>
        </div>
    </div>;
}