import { ReactNode } from "react";

interface Props {
    children: ReactNode;
    className?: string;
    onClick?: () => void;
}

export default function TableRow(props: Props) {
    return (
        <tr
            className={`border-b border-b-gray-300 hover:cursor-pointer hover:bg-gray-100 transition-colors ${
                props.className ?? ""
            }`}
            onClick={props.onClick}
        >
            {props.children}
        </tr>
    );
}
