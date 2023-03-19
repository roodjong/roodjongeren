import { PostType } from "../models/Post";
import { FaComment, FaNewspaper } from "react-icons/fa";
import { FaCommentDots } from "react-icons/fa";

type Props = {
    type: PostType;
};

export default function PostTypeDisplay(props: Props) {
    switch (props.type) {
        case PostType.NEWS:
            return <FaNewspaper className="inline mr-2" title="Nieuwsbericht" />;
        case PostType.SUBMISSION:
            return <FaComment className="inline mr-2" title="Inzending" />;
        case PostType.PETITION:
            return <FaCommentDots className="inline mr-2" title="Petitie" />;
        default:
            return <span>Onbekend type</span>;
    }
}
