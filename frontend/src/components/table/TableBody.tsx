import { ReactNode } from "react";

interface Props {
    children: ReactNode;
}

export default function TableBody(props: Props) {
    return <tbody>{props.children}</tbody>;
}
