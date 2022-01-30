import Head from 'next/head';
import {fetchFallbackBanner, fetchWorkgroups} from '../utils/backend';
import {Workgroup} from '../models/Workgroup';
import WorkgroupCard from '../components/WorkgroupCard';
import Banner from '../components/Banner';
import Main from '../components/Main';
import {GetStaticPropsResult} from 'next';
import {revalidate} from '../utils/revalidate';

interface Props {
    banner: string;
    workgroups: Workgroup[];
}

export default function WerkgroepenPage(props: Props) {
    return <div>
        <Head>
            <title>Werkgroepen</title>
        </Head>
        <Banner title="Werkgroepen" background={props.banner} compact/>
        <Main className="content">
            {props.workgroups.map(workgroup => <WorkgroupCard key={workgroup.name} workgroup={workgroup}/>)}
        </Main>
    </div>;
}

export async function getStaticProps(): Promise<GetStaticPropsResult<Props>> {
    const [banner, workgroups] = await Promise.all([
        fetchFallbackBanner(),
        fetchWorkgroups()
    ]);
    
    return {
        props: {banner, workgroups},
        revalidate
    };
}