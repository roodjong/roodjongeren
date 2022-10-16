import {fetchJoinUs} from '../utils/backend';
import Markdown from '../components/Markdown';
import JoinUsContent from '../models/JoinUsContent';
import {FaFistRaised} from 'react-icons/fa';
import Link from 'next/link';
import Banner from '../components/Banner';
import Main from '../components/Main';
import {GetStaticPropsResult} from 'next';
import {revalidate} from '../utils/revalidate';
import HeadPage from '../components/HeadPage';

interface Props {
    content: JoinUsContent;
}

export default function JoinUsPage(props: Props) {
    return <div>
        <HeadPage title="Word lid"
                  description="Actief worden in de grootste socialistische jongerenorganisatie van Nederland"
                  url="https://roodjongeren.nl/word-lid"/>
        <Banner title="Word lid" background={props.content.banner} compact/>
        <Main className="container">
            <Markdown content={props.content.content}/>
            <a className="button-primary inline-block text-3xl umami--click--inschrijven"
               href="https://mijn.roodjongeren.nl/aanmelden">
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
