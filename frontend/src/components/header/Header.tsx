import Image from "next/image";
import Link from "next/link";
import HeaderLink from "./HeaderLink";
import { useEffect, useState } from "react";
import { FaBars, FaTimes } from "react-icons/fa";
import { useRouter } from "next/router";
import HeaderDropdown from "./HeaderDropdown";
import SkipToContent from "../table/SkipToContent";

export default function Header() {
    const router = useRouter();
    const [hasScrolled, setHasScrolled] = useState<boolean>(false);
    const [isMenuOpen, setMenuOpen] = useState<boolean>(false);

    useEffect(() => {
        const handleScroll = () =>
            setHasScrolled((prevState) =>
                prevState ? window.scrollY > 0 : window.scrollY > 50
            );
        window.addEventListener("scroll", handleScroll);
        return () => window.removeEventListener("scroll", handleScroll);
    }, []);

    useEffect(() => {
        setMenuOpen(false);
    }, [router.pathname]);

    useEffect(() => {
        if (!isMenuOpen) return;
        const handleKey = (e: KeyboardEvent) => {
            if (e.key === "Escape") setMenuOpen(false);
        };
        window.addEventListener("keydown", handleKey);
        return () => window.removeEventListener("keydown", handleKey);
    }, [isMenuOpen]);

    return (
        <header className="fixed w-full top-0 z-[2000] shadow-[#0002] shadow-md bg-white overflow-y-auto lg:overflow-visible">
            <SkipToContent />
            <nav className="container py-0 flex lg:gap-4 flex-col lg:flex-row items-stretch max-h-screen">
                <div className="flex gap-4 justify-between items-center">
                    <Link href="/" passHref legacyBehavior>
                        <div
                            className={`flex py-2 mr-4 cursor-pointer transition-all min-w-[64px] ${
                                hasScrolled ? "w-[64px]" : "w-[64px] md:w-[128px]"
                            }`}
                        >
                            <Image
                                src="/images/rood-logo.svg"
                                width="128"
                                height="128"
                                alt="Logo ROOD"
                            />
                        </div>
                    </Link>
                    <button
                        type="button"
                        className="lg:hidden text-2xl inline-block mr-4 focus-visible:outline-2 focus-visible:outline-primary"
                        onClick={() => setMenuOpen(!isMenuOpen)}
                        aria-expanded={isMenuOpen}
                        aria-controls="primary-navigation"
                        aria-label={isMenuOpen ? "Sluit menu" : "Open menu"}
                    >
                        {isMenuOpen ? (
                            <FaTimes className="inline-block" aria-hidden="true" />
                        ) : (
                            <FaBars className="inline-block" aria-hidden="true" />
                        )}
                    </button>
                </div>
                <div
                    id="primary-navigation"
                    className={`grow flex flex-col lg:flex-row items-stretch duration-500 easy-in-out
                             lg:max-h-full ${
                                 isMenuOpen ? "max-h-screen" : "max-h-0 overflow-hidden"
                             }`}
                >
                    <HeaderLink href="/" exact>
                        Home
                    </HeaderLink>
                    <HeaderDropdown title="Over ons">
                        <HeaderLink href="/over-ons">Organisatie</HeaderLink>
                        <HeaderLink href="/programma">Programma</HeaderLink>
                        <HeaderLink href="/afdelingen">Afdelingen</HeaderLink>
                        <HeaderLink href="/werkgroepen">Werkgroepen</HeaderLink>
                        <HeaderLink href="/vertrouwenspersonen">
                            Vertrouwenspersonen
                        </HeaderLink>
                    </HeaderDropdown>
                    <HeaderLink href="/posts">Posts</HeaderLink>
                    <HeaderLink href="/word-lid">Word lid</HeaderLink>
                    <HeaderLink href="https://shop.roodjongeren.nl/" externalLink>
                        Shop
                    </HeaderLink>
                    <HeaderLink href="https://rsp.nu">RSP</HeaderLink>
                    <HeaderLink href="https://mijn.roodjongeren.nl" externalLink>
                        Inloggen
                    </HeaderLink>
                </div>
            </nav>
        </header>
    );
}
