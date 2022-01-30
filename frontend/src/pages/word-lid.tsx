import Head from 'next/head';
import {fetchJoinUs} from '../utils/backend';
import Markdown from '../components/Markdown';
import JoinUsContent from '../models/JoinUsContent';
import {FaFistRaised} from 'react-icons/fa';
import Link from 'next/link';
import Banner from '../components/Banner';
import Main from '../components/Main';
import {GetStaticPropsResult} from 'next';
import {revalidate} from '../utils/revalidate';

interface Props {
    content: JoinUsContent;
}

export default function JoinUsPage(props: Props) {
    return <div>
        <Head>
            <title>Word lid</title>
        </Head>
        <Banner title="Word lid" background={props.content.banner} compact/>
        <Main className="content">
            <Markdown content={props.content.content}/>
            <a className="button-primary inline-block text-3xl"
               href="https://mijnrood.nl/aanmelden">
                Inschrijven <FaFistRaised className="inline align-baseline ml-2"/>
            </a>
            <p className="mt-4">
                <Link href="/steun-ons">
                    <a className="text-primary underline">
                        Te oud voor ROOD? Word steunlid!
                    </a>
                </Link>
            </p>
        </Main>
    </div>;
}

export async function getStaticProps(): Promise<GetStaticPropsResult<Props>> {
    return {
        props: {
            content: await fetchJoinUs()
        },
        revalidate
    };
}