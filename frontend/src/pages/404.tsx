import Head from 'next/head';
import Image from 'next/image';
import {fetchFallback} from '../utils/backend';
import Banner from '../components/Banner';
import {GetStaticPropsResult} from 'next';
import {revalidate} from '../utils/revalidate';

interface Props {
    pageBanner: string;
}


export default function Custom404Page(props: Props) {
    return <div className="text-6xl text-center">
        <Head>
            <title>404 - Pagina niet gevonden</title>
        </Head>
        <Banner title="Pagina niet gevonden"
                subtitle={<div className="rounded shadow overflow-hidden mt-4">
                    <Image src="/images/sad-meme.webp" width="128" height="128" alt=""/>
                </div>}
                background={props.pageBanner}/>
    </div>;
}

export async function getStaticProps(): Promise<GetStaticPropsResult<Props>> {
    const {pageBanner} = await fetchFallback();
    
    return {
        props: {
            pageBanner
        },
        revalidate
    };
}