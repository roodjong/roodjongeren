import Subheader from "./Subheader";
import Markdown from "./Markdown";
import { Workgroup } from "../models/Workgroup";

interface Props {
    workgroup: Workgroup;
}

export default function WorkgroupCard(props: Props) {
    const workgroup = props.workgroup;
    return (
        <div className="mb-8 shadow-inner bg-gray-50 p-4 rounded">
            <Subheader>{workgroup.name}</Subheader>
            <Markdown content={workgroup.about} />
        </div>
    );
}
