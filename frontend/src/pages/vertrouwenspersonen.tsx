import Head from 'next/head';
import {fetchConfidants, fetchConfidantsPage} from '../utils/backend';
import {Confidant} from '../models/Confidant';
import Markdown from '../components/Markdown';
import ConfidantsPageContent from '../models/ConfidantsPageContent';
import ConfidantCard from '../components/ConfidantCard';
import Banner from '../components/Banner';
import Main from '../components/Main';
import {GetStaticPropsResult} from 'next';
import {revalidate} from '../utils/revalidate';

interface Props {
    content: ConfidantsPageContent;
    confidants: Confidant[];
}

export default function VertrouwenspersonenPage(props: Props) {
    return <div>
        <Head>
            <title>Vertrouwenspersonen</title>
        </Head>
        <Banner title="Vertrouwens&shy;personen" background={props.content.banner} compact/>
        <Main className="container">
            <div className="mb-8">
                <Markdown content={props.content.content}/>
            </div>
            {props.confidants.map(confidant => <ConfidantCard key={confidant.name} confidant={confidant}/>)}
        </Main>
    </div>;
}

export async function getStaticProps(): Promise<GetStaticPropsResult<Props>> {
    const [content, confidants] = await Promise.all([
        fetchConfidantsPage(),
        fetchConfidants()
    ]);
    
    return {
        props: {content, confidants},
        revalidate
    };
}