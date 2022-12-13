import { ReactNode } from "react";

interface Props {
    wrap: boolean;
    wrapper: (children: ReactNode) => ReactNode;
    children: ReactNode;
}

export default function ConditionalWrapper(props: Props) {
    return <>{props.wrap ? props.wrapper(props.children) : props.children}</>;
}
