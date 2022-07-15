import Head from 'next/head';
import {fetchFallback, fetchWorkgroups} from '../utils/backend';
import {Workgroup} from '../models/Workgroup';
import WorkgroupCard from '../components/WorkgroupCard';
import Banner from '../components/Banner';
import Main from '../components/Main';
import {GetStaticPropsResult} from 'next';
import {revalidate} from '../utils/revalidate';

interface Props {
    pageBanner: string;
    workgroups: Workgroup[];
}

export default function WerkgroepenPage(props: Props) {
    return <div>
        <Head>
            <title>Werkgroepen</title>
        </Head>
        <Banner title="Werkgroepen" background={props.pageBanner} compact/>
        <Main className="container">
            {props.workgroups.map(workgroup => <WorkgroupCard key={workgroup.name} workgroup={workgroup}/>)}
        </Main>
    </div>;
}

export async function getStaticProps(): Promise<GetStaticPropsResult<Props>> {
    const [{pageBanner}, workgroups] = await Promise.all([
        fetchFallback(),
        fetchWorkgroups()
    ]);
    
    return {
        props: {pageBanner, workgroups},
        revalidate
    };
}