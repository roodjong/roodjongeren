import Head from 'next/head';
import Markdown from '../components/Markdown';
import Banner from '../components/Banner';
import Main from '../components/Main';
import {GetStaticPropsResult} from 'next';
import {revalidate} from '../utils/revalidate';
import {fetchProgram} from '../utils/backend';
import ProgramContent from '../models/ProgramContent';

interface Props {
    content: ProgramContent;
}

export default function ProgrammaPage(props: Props) {
    return <div>
        <Head>
            <title>Programma</title>
        </Head>
        <Banner title="Programma" background={props.content.banner} compact/>
        <Main className="container">
            <Markdown content={props.content.content}/>
        </Main>
    </div>;
}

export async function getStaticProps(): Promise<GetStaticPropsResult<Props>> {
    return {
        props: {
            content: await fetchProgram()
        },
        revalidate
    };
}