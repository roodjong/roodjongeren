import {ReactNode} from 'react';

interface Props {
    children?: ReactNode;
    className?: string;
}

export default function TableHeadCell(props: Props) {
    return <th className={`text-sm text-faded p-2 ${props.className ?? ''}`}>
        {props.children}
    </th>;
}
