import Head from 'next/head';
import {fetchAfdeling, fetchAfdelingen, fetchFallbackBanner, fetchPosts} from '../../utils/backend';
import Afdeling from '../../models/Afdeling';
import {ParsedUrlQuery} from 'querystring';
import {GetStaticPropsContext, GetStaticPropsResult} from 'next';
import Markdown from '../../components/Markdown';
import ContactDisplay from '../../components/ContactDisplay';
import {IconContext} from 'react-icons';
import {FaFacebook, FaInstagram, FaTwitter} from 'react-icons/fa';
import Banner from '../../components/Banner';
import Main from '../../components/Main';
import {revalidate} from '../../utils/revalidate';
import {Post} from '../../models/Post';
import EndlessNewsLoader from '../../components/EndlessNewsLoader';
import Subheader from '../../components/Subheader';

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
        <Main className="content flex flex-col-reverse md:flex-row gap-4 justify-between">
            <div>
                <div className="flex text-base mt-2 mb-6 gap-4 text-primary">
                    <IconContext.Provider value={{className: '!text-primary origin-center group-hover:scale-125 transition-transform inline mr-2'}}>
                        {afdeling.twitterLink && <a className="group hover:underline" href={afdeling.twitterLink}><FaTwitter/> Twitter</a>}
                        {afdeling.facebookLink && <a className="group hover:underline" href={afdeling.facebookLink}><FaFacebook/> Facebook</a>}
                        {afdeling.instagramLink && <a className="group hover:underline" href={afdeling.instagramLink}><FaInstagram/> Instagram</a>}
                    </IconContext.Provider>
                </div>
                <Markdown content={afdeling.about}/>
            </div>
            <div>
                <ContactDisplay header="Contactpersoon"
                                email={afdeling.email}
                                name={afdeling.contactpersoon ? `${afdeling.contactpersoon.firstname} ${afdeling.contactpersoon.lastname}` : undefined}
                                phone={afdeling.contactpersoon?.phone ?? undefined}/>
            </div>
        </Main>
        <div className="content">
            <Subheader>Laatste nieuws</Subheader>
            <EndlessNewsLoader posts={props.posts} afdeling={props.afdeling.slug}/>
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
        fetchPosts(null, params.slug, 1, 4)
    ]);
    
    return {
        props: {fallbackBanner, afdeling, posts},
        revalidate
    };
}