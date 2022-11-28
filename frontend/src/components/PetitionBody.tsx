import { useRouter } from "next/router";
import { useEffect, useState } from "react";
import { PetitionDetail } from "../models/Petition";
import { PostDetail } from "../models/Post";
import Main from "./Main";
import Markdown from "./Markdown";
import PetitionCard from "./PetitionCard";

interface Props {
    post: PostDetail;
    petition: PetitionDetail;
    fallbackBanner: string;
}

export default function PetitionBody(props: Props) {
    const petition = props.petition;
    const post = props.post;

    const { asPath } = useRouter();
    const [signThanks, setSignThanks] = useState(false);

    useEffect(() => {
        const hash = asPath.split("#")[1];
        if (hash && hash.includes("thanks")) {
            setSignThanks(true);
        }
    }, [asPath]);

    return (
        <>
            {signThanks && (
                <div className="mt-3 font-title text-2xl font-bold bg-primary text-white container">
                    Bedankt voor het ondertekenen! Misschien kun je de petitie nu delen?
                </div>
            )}
            <Main className="pt-8 container md:max-w-screen-xl mx-auto flex flex-col md:flex-row gap-4">
                <div className="md:basis-4/12 md:ml-auto">
                    <PetitionCard
                        petition={petition}
                        className="md:sticky md:top-[90px]"
                    />
                </div>
                <div className="md:basis-8/12 md:order-first">
                    <Markdown content={post.content} />
                </div>
            </Main>
        </>
    );
}
