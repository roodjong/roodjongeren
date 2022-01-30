import {ReactNode} from 'react';

interface Props {
    children: ReactNode;
    className?: string;
}

export default function Main(props: Props) {
    return <main id="main-content"
                 className={props.className}>
        {props.children}
    </main>;
}