import { ParsedUrlQuery } from "querystring";
import { GetStaticPathsResult, GetStaticPropsContext } from "next";
import { PostDetail, PostType } from "../../models/Post";
import { fetchFallback, fetchPost, fetchPostSlugs } from "../../utils/backend";
import { dateToText } from "../../utils/date";
import Banner from "../../components/Banner";
import { revalidate } from "../../utils/revalidate";
import HeadArticle from "../../components/HeadArticle";
import PetitionBody from "../../components/PetitionBody";
import PostBody from "../../components/PostBody";

interface Params extends ParsedUrlQuery {
    slug: string;
}

interface Props {
    post: PostDetail;
    fallbackBanner: string;
}

export default function PostPage(props: Props) {
    const post = props.post;

    const content =
        post.type == PostType.PETITION && post.petition ? (
            <PetitionBody
                post={post}
                petition={post.petition}
                fallbackBanner={props.fallbackBanner}
            />
        ) : (
            <PostBody post={props.post} fallbackBanner={props.fallbackBanner} />
        );

    return (
        <div>
            <HeadArticle post={post} />
            <Banner
                title={post.title}
                background={post.banner ?? props.fallbackBanner}
                compact
            />
            {content}
        </div>
    );
}

export async function getStaticPaths(): Promise<GetStaticPathsResult> {
    const { slugs } = await fetchPostSlugs();

    const paths = slugs.map((slug) => ({
        params: { slug },
    }));

    return {
        paths,
        fallback: "blocking",
    };
}

export async function getStaticProps(context: GetStaticPropsContext) {
    const params = context.params as Params;

    const [post, { pageBanner }] = await Promise.all([
        fetchPost(params.slug),
        fetchFallback(),
    ]);

    return {
        props: { post, fallbackBanner: pageBanner },
        revalidate,
    };
}
