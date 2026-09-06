import { GetStaticPropsResult } from "next";
import { FaFilePdf } from "react-icons/fa";
import Banner from "../components/Banner";
import HeadPage from "../components/HeadPage";
import Main from "../components/Main";
import { fetchFallback } from "../utils/backend";
import { revalidate } from "../utils/revalidate";

const statutesUrl =
    "https://roodjongeren.nl/backend/uploads/Statuten_ROOD_Socialistische_Jongeren_df97d7e2e0.pdf";

interface Props {
    pageBanner: string;
}

export default function StatutenPage(props: Props) {
    return (
        <div>
            <HeadPage
                title="Statuten"
                description="De statuten van ROOD, Socialistische Jongeren"
                url="https://roodjongeren.nl/statuten"
            />
            <Banner title="Statuten" background={props.pageBanner} compact />
            <Main className="container max-w-4xl">
                <p className="mt-8 text-xl">
                    De statuten zijn de formele regels van ROOD, Socialistische Jongeren.
                    Ze zijn voor het laatst gewijzigd op de Algemene Ledenvergadering van
                    23 april 2026 in Utrecht.
                </p>
                <a
                    href={statutesUrl}
                    className="button-primary mt-8 inline-flex items-center gap-3 focus-visible:outline-2 focus-visible:outline-offset-2 focus-visible:outline-primary"
                    target="_blank"
                    rel="noreferrer"
                >
                    <FaFilePdf aria-hidden="true" />
                    Bekijk de statuten (PDF)
                </a>
                <p className="mt-4 mb-12 text-sm text-faded">
                    De statuten openen in een nieuw tabblad.
                </p>
            </Main>
        </div>
    );
}

export async function getStaticProps(): Promise<GetStaticPropsResult<Props>> {
    const { pageBanner } = await fetchFallback();

    return {
        props: { pageBanner },
        revalidate,
    };
}
