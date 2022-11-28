import { ReactNode } from "react";

interface Props {
    children: ReactNode;
    className?: string;
}

export default function TableCell(props: Props) {
    return <td className={`p-2 ${props.className ?? ""}`}>{props.children}</td>;
}
