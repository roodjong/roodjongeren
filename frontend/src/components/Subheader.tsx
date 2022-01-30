import {ReactNode} from 'react';

interface Props {
    children: ReactNode;
}

export default function Subheader(props: Props) {
    return <div>
        <h2 className="font-title text-3xl bg-primary py-2 px-4 text-white font-bold inline-block -skew-y-1">
            {props.children}
        </h2>
    </div>;
}
