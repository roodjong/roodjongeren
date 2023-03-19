import Link from "next/link";
import { FaFistRaised, FaHandHoldingHeart } from "react-icons/fa";
import { IconContext } from "react-icons";
import Markdown from "./Markdown";

interface Props {
    content: string;
}

export default function AboutUsShort(props: Props) {
    return (
        <div className="w-full">
            <div className="p-4">
                <div className="container pt-8 pb-12">
                    <div className="justify-between gap-8 sm:gap-16 flex flex-col sm:flex-row">
                        <div>
                            <Markdown content={props.content} />
                        </div>
                        <IconContext.Provider
                            value={{
                                className: "inline-block ml-2 align-baseline",
                            }}
                        >
                            <div className="flex flex-col gap-8">
                                <Link
                                    href="/word-lid"
                                    className="button-primary text-3xl"
                                >
                                    Word lid
                                    <FaFistRaised />
                                </Link>
                                <Link
                                    href="/word-lid#steun-ons"
                                    className="button-primary text-3xl"
                                >
                                    Steun ons
                                    <FaHandHoldingHeart />
                                </Link>
                            </div>
                        </IconContext.Provider>
                    </div>
                </div>
            </div>
        </div>
    );
}
