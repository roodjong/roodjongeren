import Image from "next/image";
import imageLoader from "../utils/image-loader";
import { ReactNode } from "react";

interface Props {
    title: string;
    subtitle?: ReactNode;
    background: string;
    compact?: boolean;
}

export default function Banner(props: Props) {
    return (
        <div
            className={`w-full bg-center bg-cover relative bg-secondary flex items-center min-h-screen ${
                props.compact ? "md:!min-h-[32rem] md:mt-[64px]" : ""
            }`}
        >
            <Image
                src={props.background}
                fill
                sizes="100vw"
                loader={imageLoader}
                alt="Banner"
                className="object-cover"
            />
            <div className="absolute top-0 left-0 w-full h-full bg-gradient-to-b from-primary to-transparent mix-blend-darken" />
            <div
                className="absolute top-0 left-0 w-full h-full bg-primary mix-blend-darken"
                style={{ clipPath: "polygon(101% 85%, 40% 101%, 101% 101%)" }}
            />
            <div
                className="absolute top-0 left-0 w-full h-full bg-primary"
                style={{ clipPath: "polygon(0% 85%, 0% 101%, 60% 101%)" }}
            />
            <div className="w-full px-4 pt-[128px] pb-16 text-white text-center relative font-title leading-none">
                <h1
                    className="text-[4rem] sm:text-[5rem] md:text-[6rem] font-bold"
                    style={{ wordBreak: "break-word" }}
                >
                    {props.title}
                </h1>
                <h2 className="text-[3rem] sm:text-[4rem] md:text-[4rem]">
                    {props.subtitle}
                </h2>
                <ContentLink />
            </div>
        </div>
    );
}

function ContentLink() {
    return (
        <div className="mt-12">
            <a href="#main-content" className="inline-block group" tabIndex={-1}>
                <div className="flex mt-12 opacity-80 group-hover:opacity-100 transition-opacity">
                    <div className="h-[3px] w-14 bg-white transition-colors origin-right rotate-45" />
                    <div className="h-[3px] w-14 bg-white transition-colors origin-left -rotate-45" />
                </div>
            </a>
        </div>
    );
}
