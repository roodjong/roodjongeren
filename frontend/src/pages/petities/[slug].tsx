import { GetStaticPathsResult, GetStaticPropsContext } from "next";
import { ParsedUrlQuery } from "querystring";
import {
  fetchFallback,
  fetchPetition,
  fetchPetitionSlugs,
  fetchPost,
} from "../../utils/backend";
import { revalidate } from "../../utils/revalidate";
import PostPage from "../post/[slug]";
import { PostPageProps } from "../post/[slug]";

interface Params extends ParsedUrlQuery {
  slug: string;
}

export default function PetitionPage(props: PostPageProps) {
  return PostPage(props);
}

export async function getStaticPaths(): Promise<GetStaticPathsResult> {
  const { slugs } = await fetchPetitionSlugs();

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
    fetchPost(params.slug, true),
    fetchFallback(),
  ]);

  return {
    props: { post, fallbackBanner: pageBanner },
    revalidate,
  };
}
