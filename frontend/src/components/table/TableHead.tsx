import { ReactNode } from "react";

interface Props {
    children: ReactNode;
}

export default function TableHead(props: Props) {
    return (
        <thead>
            <tr className="border-b border-b-gray-300">{props.children}</tr>
        </thead>
    );
}
