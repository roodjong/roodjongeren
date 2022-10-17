import Image from 'next/image';
import Link from 'next/link';
import {FaFacebook, FaGithub, FaInstagram, FaReddit, FaTiktok, FaTwitter} from 'react-icons/fa';
import {IconContext} from 'react-icons';

export default function Footer() {
    return <footer className="bg-primary text-white">
        <div className="container flex flex-col py-12 sm:flex-row gap-8 sm:gap-4 items-center text-center sm:text-left justify-between">
            <div>
                <Image src="/images/rood-logo-white.svg" width="128px" height="128px" alt="Logo ROOD"/>
            </div>
            <div className="flex flex-col gap-2">
                <a href="mailto:info@roodjongeren.nl"
                   className="hover:underline umami--click--footer-email">info@roodjongeren.nl</a>
                <Link href="/privacybeleid">
                    <a className="hover:underline">Privacybeleid</a>
                </Link>
                <a href="https://mijn.roodjongeren.nl"
                   className="hover:underline umami--click--footer-mijnrood">
                    mijnROOD
                </a>
                <p>KVK: 24349986</p>
                <a href="https://www.google.nl/maps/place/Gaffelstraat+61B,+3014+RC+Rotterdam"
                   className="hover:underline umami--click--footer-adres">
                    <p>Gaffelstraat 61B</p>
                    <p>3014 RC Rotterdam</p>
                </a>
            </div>
            <div className="flex flex-col gap-2">
                <IconContext.Provider value={{className: 'inline mr-2 origin-center group-hover:scale-125 transition-transform'}}>
                    <a href="https://twitter.com/ROODjong"
                       className="hover:underline group umami--click--footer-twitter">
                        <FaTwitter/>Twitter
                    </a>
                    <a href="https://www.facebook.com/ROODjongSP"
                       className="hover:underline group umami--click--footer-facebook">
                        <FaFacebook/>Facebook
                    </a>
                    <a href="https://www.instagram.com/roodsocialistischejongeren"
                       className="hover:underline group umami--click--footer-instagram">
                        <FaInstagram/>Instagram
                    </a>
                    <a href="https://www.tiktok.com/@roodjong"
                       className="hover:underline group umami--click--footer-tiktok">
                        <FaTiktok/>Tiktok
                    </a>
                    <a href="https://github.com/roodjong"
                       className="hover:underline group umami--click--footer-github">
                        <FaGithub/>GitHub
                    </a>
                    <a href="https://reddit.com/r/Poldersocialisme/"
                       className="hover:underline group umami--click--footer-reddit">
                        <FaReddit/>Reddit
                    </a>
                </IconContext.Provider>
            </div>
        </div>
    </footer>;
}
