import Head from 'next/head';
import {fetchAfdeling, fetchAfdelingen, fetchFallbackBanner, fetchPosts} from '../../utils/backend';
import Afdeling from '../../models/Afdeling';
import {ParsedUrlQuery} from 'querystring';
import {GetStaticPropsContext, GetStaticPropsResult} from 'next';
import Markdown from '../../components/Markdown';
import ContactDisplay from '../../components/ContactDisplay';
import {IconContext} from 'react-icons';
import {FaAt, FaFacebook, FaInstagram, FaTwitter} from 'react-icons/fa';
import Banner from '../../components/Banner';
import Main from '../../components/Main';
import {revalidate} from '../../utils/revalidate';
import {Post} from '../../models/Post';
import Subheader from '../../components/Subheader';
import EndlessPostsLoader from '../../components/EndlessPostsLoader';

interface Params extends ParsedUrlQuery {
    slug: string;
}

interface Props {
    fallbackBanner: string;
    afdeling: Afdeling;
    posts: Post[];
}

export default function AfdelingPage(props: Props) {
    const afdeling = props.afdeling;
    
    return <div>
        <Head>
            <title>{afdeling.name}</title>
        </Head>
        <Banner title={afdeling.name} background={afdeling.banner ?? props.fallbackBanner} compact/>
        <Main className="container flex flex-col-reverse md:flex-row gap-4 justify-between">
            <div>
                <div className="flex text-base mt-2 mb-6 gap-2 lg:gap-4 text-primary lg:flex-row flex-col">
                    <IconContext.Provider value={{className: '!text-primary origin-center group-hover:scale-125 transition-transform inline mr-2'}}>
                        {afdeling.twitterLink && <a className="group hover:underline" href={afdeling.twitterLink}><FaTwitter/> Twitter</a>}
                        {afdeling.facebookLink && <a className="group hover:underline" href={afdeling.facebookLink}><FaFacebook/> Facebook</a>}
                        {afdeling.instagramLink && <a className="group hover:underline" href={afdeling.instagramLink}><FaInstagram/> Instagram</a>}
                        <a className="group text-primary hover:underline" href={`mailto:${afdeling.email}`}>
                            <FaAt/>{props.afdeling.email}
                        </a>
                    </IconContext.Provider>
                </div>
                <Markdown content={afdeling.about}/>
            </div>
            <div>
                <ContactDisplay afdeling={afdeling}/>
            </div>
        </Main>
        <div className="container">
            <Subheader>Laatste nieuws & inzendingen</Subheader>
            <EndlessPostsLoader posts={props.posts} afdeling={props.afdeling.slug}/>
        </div>
    </div>;
}

export async function getStaticPaths() {
    return {
        paths: (await fetchAfdelingen()).map(afdeling => ({
            params: {
                slug: afdeling.slug
            }
        })),
        fallback: 'blocking'
    };
}

export async function getStaticProps(context: GetStaticPropsContext): Promise<GetStaticPropsResult<Props>> {
    const params = context.params as Params;
    
    const [fallbackBanner, afdeling, {posts}] = await Promise.all([
        fetchFallbackBanner(),
        fetchAfdeling(params.slug),
        fetchPosts(undefined, undefined, params.slug, 1, 4)
    ]);
    
    return {
        props: {fallbackBanner, afdeling, posts},
        revalidate
    };
}