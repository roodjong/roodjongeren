import Image from "next/image";
import imageLoader from "../utils/image-loader";
import { Confidant } from "../models/Confidant";
import Subheader from "./Subheader";
import { IconContext } from "react-icons";
import { FaEnvelope, FaPhone } from "react-icons/fa";
import Markdown from "./Markdown";

interface Props {
    confidant: Confidant;
}

export default function ConfidantCard(props: Props) {
    const confidant = props.confidant;
    return (
        <div className="flex flex-col md:flex-row gap-8 mb-8 shadow-inner bg-gray-50 p-4 rounded">
            <div className="float-right relative md:min-w-[20rem] h-[20rem] rounded shadow-lg overflow-hidden">
                <Image
                    src={confidant.photo}
                    fill
                    className="object-cover"
                    loader={imageLoader}
                    alt={`Foto van ${confidant.name}`}
                />
            </div>
            <div>
                <Subheader>{confidant.name}</Subheader>
                <div className="flex flex-col text-base my-4 gap-4 text-primary">
                    <IconContext.Provider
                        value={{
                            className:
                                "!text-primary origin-center group-hover:scale-125 transition-transform inline mr-2",
                        }}
                    >
                        <p>
                            <a
                                className="group hover:underline"
                                href={`mailto:${confidant.email}`}
                            >
                                <FaEnvelope />
                                {confidant.email}
                            </a>
                        </p>
                        <p>
                            <a
                                className="group hover:underline"
                                href={`tel:${confidant.phone}`}
                            >
                                <FaPhone />
                                {confidant.phone}
                            </a>
                        </p>
                    </IconContext.Provider>
                </div>
                <Markdown content={confidant.about} />
            </div>
        </div>
    );
}
