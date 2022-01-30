import Head from 'next/head';
import {fetchFallbackBanner, fetchPrivacybeleid} from '../utils/backend';
import PrivacybeleidContent from '../models/PrivacybeleidContent';
import Markdown from '../components/Markdown';
import Banner from '../components/Banner';
import Main from '../components/Main';
import {revalidate} from '../utils/revalidate';
import {GetStaticPropsResult} from 'next';

interface Props {
    banner: string;
    privacybeleid: PrivacybeleidContent;
}

export default function PrivacybeleidPage(props: Props) {
    return <div>
        <Head>
            <title>Privacybeleid</title>
        </Head>
        <Banner title="Privacybeleid" background={props.banner} compact/>
        <Main className="content">
            <Markdown content={props.privacybeleid.content}/>
        </Main>
    </div>;
}

export async function getStaticProps(): Promise<GetStaticPropsResult<Props>> {
    
    const [banner, privacybeleid] = await Promise.all([
        fetchFallbackBanner(),
        fetchPrivacybeleid()
    ]);
    
    return {
        props: {banner, privacybeleid},
        revalidate
    };
}