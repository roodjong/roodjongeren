import { fetchFallback, fetchWorkgroups, fetchWorkgroupsPage } from "../utils/backend";
import { Workgroup } from "../models/Workgroup";
import WorkgroupCard from "../components/WorkgroupCard";
import Banner from "../components/Banner";
import Main from "../components/Main";
import { GetStaticPropsResult } from "next";
import { revalidate } from "../utils/revalidate";
import HeadPage from "../components/HeadPage";
import WorkgroupPageContent from "../models/WorkgroupPageContent";
import Markdown from "../components/Markdown";

interface Props {
    content: WorkgroupPageContent;
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
            <Banner title="Werkgroepen" background={props.content.banner} compact />
            <Main className="container">
                <div className="mb-8">
                    <Markdown content={props.content.content} />
                </div>
                {props.workgroups.map((workgroup) => (
                    <WorkgroupCard key={workgroup.name} workgroup={workgroup} />
                ))}
            </Main>
        </div>
    );
}

export async function getStaticProps(): Promise<GetStaticPropsResult<Props>> {
    const [content, workgroups] = await Promise.all([
        fetchWorkgroupsPage(),
        fetchWorkgroups(),
    ]);

    return {
        props: { content, workgroups },
        revalidate,
    };
}
