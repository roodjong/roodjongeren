import Head from 'next/head';
import Image from 'next/image';
import {fetchFallbackBanner} from '../utils/backend';
import Banner from '../components/Banner';
import {GetStaticPropsResult} from 'next';
import {revalidate} from '../utils/revalidate';

interface Props {
    banner: string;
}


export default function Custom500Page(props: Props) {
    return <div className="text-6xl text-center">
        <Head>
            <title>500 - Interne serverfout</title>
        </Head>
        <Banner title="Interne serverfout. De revolutie heeft gefaald."
                subtitle={<div className="rounded shadow overflow-hidden mt-4">
                    <Image src="/images/sad-meme.webp" width="128" height="128" alt=""/>
                </div>}
                background={props.banner}/>
    </div>;
}

export async function getStaticProps(): Promise<GetStaticPropsResult<Props>> {
    return {
        props: {
            banner: await fetchFallbackBanner()
        },
        revalidate
    };
}