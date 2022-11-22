import { GetStaticPathsResult, GetStaticPropsContext } from "next";
import Head from "next/head";
import Link from "next/link";
import { useRouter } from "next/router";
import { ParsedUrlQuery } from "querystring";
import { useEffect, useState } from "react";
import Banner from "../../components/Banner";
import Main from "../../components/Main";
import Markdown from "../../components/Markdown";
import PetitionCard from "../../components/PetitionCard";
import { PetitionDetail } from "../../models/Petition";
import {
  fetchFallback,
  fetchPetition,
  fetchPetitionSlugs,
} from "../../utils/backend";
import { revalidate } from "../../utils/revalidate";

interface Params extends ParsedUrlQuery {
  slug: string;
}

interface Props {
  petition: PetitionDetail;
  fallbackBanner: string;
}

export default function PetitionPage(props: Props) {
  const petition = props.petition;

  const { asPath } = useRouter();
  const [signThanks, setSignThanks] = useState(<></>);

  useEffect(() => {
    const hash = asPath.split("#")[1];
    if (hash && hash.includes("thanks")) {
      setSignThanks(
        <div className="mt-3 font-title text-2xl font-bold bg-primary text-white container">
          Bedankt voor het ondertekenen! Misschien kun je de petitie nu delen?
        </div>
      );
    }
  }, [asPath]);

  return (
    <div>
      <Head>
        <title>{petition.title}</title>
      </Head>
      <Banner
        title={petition.title}
        background={props.fallbackBanner}
        compact
      />
      {signThanks}
      <Main className="pt-8 container md:max-w-screen-xl mx-auto flex flex-col md:flex-row gap-4">
        <div className="md:basis-4/12 md:ml-auto">
          <PetitionCard
            petition={petition}
            className="md:sticky md:top-[90px]"
          />
        </div>
        <div className="md:basis-8/12 md:order-first">
          <Markdown content={petition.content} />
        </div>
      </Main>
    </div>
  );
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

  const [petition, { pageBanner }] = await Promise.all([
    fetchPetition(params.slug),
    fetchFallback(),
  ]);

  return {
    props: { petition, fallbackBanner: pageBanner },
    revalidate,
  };
}
