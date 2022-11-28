import { PostType } from "../models/Post";
import { FaComment, FaNewspaper } from "react-icons/fa";
import { FaCommentDots } from "react-icons/fa";

type Props = {
    type: PostType;
};

export default function PostTypeDisplay(props: Props) {
    switch (props.type) {
        case PostType.NEWS:
            return (
                <span>
                    <FaNewspaper className="inline mr-2" />
                    Nieuwsbericht
                </span>
            );
        case PostType.SUBMISSION:
            return (
                <span>
                    <FaComment className="inline mr-2" />
                    Inzending
                </span>
            );
        case PostType.PETITION:
            return (
                <span>
                    <FaCommentDots className="inline mr-2" />
                    Petitie
                </span>
            );
        default:
            return <span>Onbekend type</span>;
    }
}
