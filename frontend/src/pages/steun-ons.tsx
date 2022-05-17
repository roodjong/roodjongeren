import Head from 'next/head';
import {fetchSupportUs} from '../utils/backend';
import Markdown from '../components/Markdown';
import {FaHandHoldingHeart} from 'react-icons/fa';
import Link from 'next/link';
import SupportUsContent from '../models/SupportUsContent';
import Banner from '../components/Banner';
import Main from '../components/Main';
import {GetStaticPropsResult} from 'next';
import {revalidate} from '../utils/revalidate';

interface Props {
    content: SupportUsContent;
}

export default function SupportUsPage(props: Props) {
    return <div>
        <Head>
            <title>Steun ons</title>
        </Head>
        <Banner title="Steun ons" background={props.content.banner} compact/>
        <Main className="container">
            <Markdown content={props.content.content}/>
            <a className="button-primary inline-block text-3xl"
               href="https://mijnrood.nl/steunlid-worden">
                Steunlid worden <FaHandHoldingHeart className="inline align-baseline ml-2"/>
            </a>
            <p className="mt-4">
                <Link href="/word-lid">
                    <a className="text-primary underline">
                        Jong en strijdbaar? Word normaal lid!
                    </a>
                </Link>
            </p>
        </Main>
    </div>;
}

export async function getStaticProps(): Promise<GetStaticPropsResult<Props>> {
    return {
        props: {
            content: await fetchSupportUs()
        },
        revalidate
    };
}