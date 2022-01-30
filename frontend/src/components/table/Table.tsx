import {ReactNode} from "react";

interface Props {
    children: ReactNode;
}

export default function Table(props: Props) {
    return <table className="w-full text-left">
        {props.children}
    </table>;
}
