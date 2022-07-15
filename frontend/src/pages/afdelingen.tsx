import Head from 'next/head';
import dynamic from 'next/dynamic';
import {useMemo} from 'react';
import {fetchAfdelingen, fetchFallback} from '../utils/backend';
import Afdeling from '../models/Afdeling';
import Subheader from '../components/Subheader';
import AfdelingenTable from '../components/AfdelingenTable';
import Banner from '../components/Banner';
import Main from '../components/Main';
import {GetStaticPropsResult} from 'next';
import {revalidate} from '../utils/revalidate';

interface Props {
    pageBanner: string;
    afdelingen: Afdeling[];
}

export default function AfdelingenPage(props: Props) {
    const AfdelingenMap = useMemo(() => dynamic(() => import('../components/AfdelingenMap'), {ssr: false}), []);
    
    return <div>
        <Head>
            <title>Afdelingen</title>
        </Head>
        <Banner title="Afdelingen" background={props.pageBanner} compact/>
        <Main>
            <div className="container">
                <Subheader>Overzicht</Subheader>
                <p className="my-4">
                    Wij hebben {props.afdelingen.length} afdelingen verspreid over Nederland.
                    Kijk op de kaart of er een afdeling bij jou in de buurt is, of begin er één!
                </p>
                <AfdelingenTable afdelingen={props.afdelingen}/>
            </div>
            <div className="container">
                <Subheader>Kaart</Subheader>
            </div>
            <AfdelingenMap afdelingen={props.afdelingen}/>
        </Main>
    </div>;
}

export async function getStaticProps(): Promise<GetStaticPropsResult<Props>> {
    const [{pageBanner}, afdelingen] = await Promise.all([
        fetchFallback(),
        fetchAfdelingen()
    ]);
    
    return {
        props: {pageBanner, afdelingen},
        revalidate
    };
}