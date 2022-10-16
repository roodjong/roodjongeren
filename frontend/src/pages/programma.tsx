import Markdown from '../components/Markdown';
import Banner from '../components/Banner';
import Main from '../components/Main';
import {GetStaticPropsResult} from 'next';
import {revalidate} from '../utils/revalidate';
import {fetchProgram} from '../utils/backend';
import ProgramContent from '../models/ProgramContent';
import HeadPage from '../components/HeadPage';

interface Props {
    content: ProgramContent;
}

export default function ProgrammaPage(props: Props) {
    return <div>
        <HeadPage title="Programma"
                  description="Het politieke basisprogramma waar ROOD-leden voor staan"
                  url="https://roodjongeren.nl/programma"/>
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