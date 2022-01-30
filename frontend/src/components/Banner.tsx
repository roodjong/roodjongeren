import Image from 'next/image';
import imageLoader from '../utils/image-loader';
import {ReactNode} from 'react';
import {FaChevronDown} from 'react-icons/fa';

interface Props {
    title: string;
    subtitle?: ReactNode;
    background: string;
    compact?: boolean;
}

export default function Banner(props: Props) {
    return <div
        className={`w-full bg-center bg-cover relative bg-secondary flex items-center min-h-screen ${props.compact ? 'md:!min-h-[32rem] md:mt-[64px]' : ''}`}>
        <Image src={props.background} layout="fill" objectFit="cover" objectPosition="center" loader={imageLoader} alt="Banner"/>
        <div className="absolute top-0 left-0 w-full h-full bg-gradient-to-b from-primary via-transparent to-transparent mix-blend-darken"/>
        <div className="absolute top-0 left-0 w-full h-full bg-primary mix-blend-darken"
             style={{clipPath: 'polygon(101% 85%, 40% 101%, 101% 101%)'}}/>
        <div className="absolute top-0 left-0 w-full h-full bg-primary"
             style={{clipPath: 'polygon(0% 85%, 0% 101%, 60% 101%)'}}/>
        <div className="w-full px-4 pt-[128px] pb-16 text-white font-bold text-center relative font-extralight uppercase font-title">
            <div className="flex w-full">
                <TitleDecoration/>
                <h1 className="text-[4rem] sm:text-[6rem] md:text-[7rem] font-bold leading-none text-outline" style={{wordBreak: 'break-word'}}>
                    {props.title}
                </h1>
                <TitleDecoration/>
            </div>
            <h2 className="text-5xl text-outline">{props.subtitle}</h2>
            <ContentLink/>
        </div>
    </div>;
}

function TitleDecoration() {
    return <div className="mt-[1.5rem] sm:mt-[2.5rem] md:mt-[3rem] border-t-2 border-b-2 border-white h-4 grow"/>;
}

function ContentLink() {
    return <div className="w-full">
        <a href="#main-content" className="inline-block" tabIndex={-1}>
            <FaChevronDown className="text-8xl text-faded hover:text-white transition-colors scale-y-[30%]"/>
        </a>
    </div>;
}
