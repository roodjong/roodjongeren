import joinPaths from '../utils/paths';
import {backendBaseUrl} from '../utils/backend';
import Head from 'next/head';
import {PostDetail} from '../models/Post';

const DESCRIPTION_LENGTH = 160;

interface Props {
    post: PostDetail;
}

export default function HeadArticle({post}: Props) {
    let description = post.content.slice(0, Math.min(DESCRIPTION_LENGTH, post.content.length));
    if (post.content.length > description.length) {
        description = description + '...';
    }
    const url = joinPaths('https://roodjongeren.nl/posts/', post.slug);
    
    return <Head>
        <title>{post.title}</title>
        <meta name="description" content={description}/>
        <meta property="og:title" content={post.title}/>
        <meta property="og:type" content="article"/>
        <meta property="og:description" content={description}/>
        <meta property="og:locale" content="nl_NL"/>
        <meta property="og:site_name" content="ROOD"/>
        <meta property="og:url" content={url}/>
        <meta property="article:published_time" content={post.publishedAt}/>
        <meta property="article:updated_time" content={post.updatedAt}/>
        <meta property="article:author" content={post.author}/>
        <meta property="twitter:domain" content="roodjongeren.nl"/>
        <meta property="twitter:url" content={url}/>
        <meta name="twitter:title" content={post.title}/>
        <meta name="twitter:description" content={description}/>
        <meta name="twitter:card" content="summary_large_image"/>
        {post.banner && <>
            <meta property="twitter:image" content={joinPaths(backendBaseUrl, post.banner)}/>
        </>}
    </Head>;
}
