import { fetchFallback, fetchWorkgroups } from "../utils/backend";
import { Workgroup } from "../models/Workgroup";
import WorkgroupCard from "../components/WorkgroupCard";
import Banner from "../components/Banner";
import Main from "../components/Main";
import { GetStaticPropsResult } from "next";
import { revalidate } from "../utils/revalidate";
import HeadPage from "../components/HeadPage";

interface Props {
    pageBanner: string;
    workgroups: Workgroup[];
}

export default function WerkgroepenPage(props: Props) {
    return (
        <div>
            <HeadPage
                title="Werkgroepen"
                description="Overzicht van groepen ROOD-leden die buiten hun afdeling om een activiteit ondernemen"
                url="https://roodjongeren.nl/werkgroepen"
            />
            <Banner title="Werkgroepen" background={props.pageBanner} compact />
            <Main className="container">
                {props.workgroups.map((workgroup) => (
                    <WorkgroupCard key={workgroup.name} workgroup={workgroup} />
                ))}
            </Main>
        </div>
    );
}

export async function getStaticProps(): Promise<GetStaticPropsResult<Props>> {
    const [{ pageBanner }, workgroups] = await Promise.all([
        fetchFallback(),
        fetchWorkgroups(),
    ]);

    return {
        props: { pageBanner, workgroups },
        revalidate,
    };
}
