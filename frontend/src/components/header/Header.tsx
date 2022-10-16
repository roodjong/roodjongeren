import Image from 'next/image';
import Link from 'next/link';
import HeaderLink from './HeaderLink';
import {useEffect, useState} from 'react';
import {FaBars, FaTimes} from 'react-icons/fa';
import {useRouter} from 'next/router';
import HeaderDropdown from './HeaderDropdown';
import SkipToContent from '../table/SkipToContent';

export default function Header() {
    const router = useRouter();
    const [hasScrolled, setHasScrolled] = useState<boolean>(false);
    const [isMenuOpen, setMenuOpen] = useState<boolean>(false);
    
    useEffect(() => {
        const handleScroll = () => setHasScrolled(prevState => prevState ? window.scrollY > 0 : window.scrollY > 50);
        window.addEventListener('scroll', handleScroll);
        return () => window.removeEventListener('scroll', handleScroll);
    }, []);
    
    useEffect(() => {
        setMenuOpen(false);
    }, [router.pathname]);
    
    return <header className="fixed w-full top-0 z-[2000] shadow-[#0002] shadow-md bg-white overflow-y-auto md:overflow-visible">
        <SkipToContent/>
        <nav className="container py-0 flex lg:gap-4 flex-col lg:flex-row items-stretch max-h-screen">
            <div className="flex gap-4 justify-between items-center">
                <Link href="/" passHref>
                    <div
                        className={`hover:skew-x-3 transition-transform flex py-2 mr-4 cursor-pointer transition-all min-w-[64px] ${hasScrolled ? 'w-[64px]' : 'w-[64px] md:w-[128px]'}`}>
                        <Image src="/images/rood-logo.svg" width="128px" height="128px" alt="Logo ROOD"/>
                    </div>
                </Link>
                <div className="lg:hidden text-2xl inline-block mr-4"
                     onClick={() => setMenuOpen(!isMenuOpen)}>
                    {isMenuOpen
                        ? <FaTimes className="inline-block"/>
                        : <FaBars className="inline-block"/>}
                </div>
            </div>
            <div className={`grow flex flex-col lg:flex-row items-stretch duration-500 easy-in-out
                             lg:max-h-full ${isMenuOpen ? 'max-h-screen' : 'max-h-0 overflow-hidden'}`}>
                <HeaderLink href="/" exact>Home</HeaderLink>
                <HeaderDropdown title="Organisatie">
                    <HeaderLink href="/over-ons">Over Ons</HeaderLink>
                    <HeaderLink href="/afdelingen">Afdelingen</HeaderLink>
                    <HeaderLink href="/werkgroepen">Werkgroepen</HeaderLink>
                    <HeaderLink href="/programma">Programma</HeaderLink>
                    <HeaderLink href="/vertrouwenspersonen">Vertrouwenspersonen</HeaderLink>
                </HeaderDropdown>
                <HeaderLink href="/actueel">Actueel</HeaderLink>
                <HeaderLink href="/word-lid">Word lid</HeaderLink>
                <HeaderLink href="/steun-ons">Steun ons</HeaderLink>
                <HeaderLink href="https://derodelap.nl/" externalLink>Shop</HeaderLink>
            </div>
        </nav>
    </header>;
}
