import Image from "next/image";
import imageLoader from "../utils/image-loader";
import { Boardmember } from "../models/Boardmember";
import Subheader from "./Subheader";
import { IconContext } from "react-icons";
import { FaEnvelope, FaPhone } from "react-icons/fa";
import Markdown from "./Markdown";

interface Props {
    boardmember: Boardmember;
}

export default function BoardmemberCard(props: Props) {
    const boardmember = props.boardmember;
    return (
        <div className="flex flex-col md:flex-row gap-8 mb-8 shadow-inner bg-gray-50 p-4 rounded">
            <div className="float-right relative md:min-w-[10rem] h-[10rem] rounded shadow-lg overflow-hidden">
                {boardmember.photo && (
                    <Image
                        src={boardmember.photo}
                        fill
                        sizes="10rem"
                        className="object-cover"
                        loader={imageLoader}
                        alt={`Foto van ${boardmember.name}`}
                    />
                )}
            </div>
            <div>
                <Subheader>{boardmember.name}</Subheader>
                <p>{boardmember.role}</p>
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
                                href={`mailto:${boardmember.email}`}
                            >
                                {boardmember.email && <FaEnvelope />}
                                {boardmember.email}
                            </a>
                        </p>
                    </IconContext.Provider>
                </div>
                <Markdown content={boardmember.extra} />
            </div>
        </div>
    );
}
