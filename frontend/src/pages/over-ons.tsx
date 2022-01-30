import Head from 'next/head';
import {fetchAboutUs} from '../utils/backend';
import AboutUsContent from '../models/AboutUsContent';
import Markdown from '../components/Markdown';
import Banner from '../components/Banner';
import Main from '../components/Main';
import {GetStaticPropsResult} from 'next';
import {revalidate} from '../utils/revalidate';

interface Props {
    content: AboutUsContent;
}

export default function OverOnsPage(props: Props) {
    return <div>
        <Head>
            <title>Over Ons</title>
        </Head>
        <Banner title="Over ons" background={props.content.banner} compact/>
        <Main className="content">
            <Markdown content={props.content.content}/>
        </Main>
    </div>;
}

export async function getStaticProps(): Promise<GetStaticPropsResult<Props>> {
    return {
        props: {
            content: await fetchAboutUs()
        },
        revalidate
    };
}