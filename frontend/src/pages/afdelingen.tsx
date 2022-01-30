import Head from 'next/head';
import dynamic from 'next/dynamic';
import {useMemo} from 'react';
import {fetchAfdelingen, fetchFallbackBanner} from '../utils/backend';
import Afdeling from '../models/Afdeling';
import Subheader from '../components/Subheader';
import AfdelingenTable from '../components/AfdelingenTable';
import Banner from '../components/Banner';
import Main from '../components/Main';
import {GetStaticPropsResult} from 'next';
import {revalidate} from '../utils/revalidate';

interface Props {
    banner: string;
    afdelingen: Afdeling[];
}

export default function AfdelingenPage(props: Props) {
    const AfdelingenMap = useMemo(() => dynamic(() => import('../components/AfdelingenMap'), {ssr: false}), []);
    
    return <div>
        <Head>
            <title>Afdelingen</title>
        </Head>
        <Banner title="Afdelingen" background={props.banner} compact/>
        <Main>
            <div className="content">
                <Subheader>Overzicht</Subheader>
                <p className="my-4">
                    Wij hebben {props.afdelingen.length} afdelingen verspreid over Nederland.
                    Kijk op de kaart of er een afdeling bij jou in de buurt is, of begin er één!
                </p>
                <AfdelingenTable afdelingen={props.afdelingen}/>
            </div>
            <div className="content">
                <Subheader>Kaart</Subheader>
            </div>
            <AfdelingenMap afdelingen={props.afdelingen}/>
        </Main>
    </div>;
}

export async function getStaticProps(): Promise<GetStaticPropsResult<Props>> {
    const [banner, afdelingen] = await Promise.all([
        fetchFallbackBanner(),
        fetchAfdelingen()
    ]);
    
    return {
        props: {banner, afdelingen},
        revalidate
    };
}