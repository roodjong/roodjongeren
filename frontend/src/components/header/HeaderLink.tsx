import Link from 'next/link';
import {ReactNode} from 'react';
import ConditionalWrapper from '../ConditionalWrapper';
import {useRouter} from 'next/router';

interface Props {
    href: string;
    children: ReactNode;
    exact?: boolean;
    externalLink?: boolean;
}

export default function Header(props: Props) {
    const router = useRouter();
    const active = props.exact
        ? router.pathname === props.href
        : router.pathname.startsWith(props.href);
    
    return <ConditionalWrapper wrap={!props.externalLink}
                               wrapper={children => <Link href={props.href}>{children}</Link>}>
        <a href={props.href}
           className="flex grow items-center justify-center p-4 cursor-pointer whitespace-nowrap relative group text-4xl font-title">
            {props.children}
            <div
                className={`absolute bottom-0 transition-transform w-full origin-bottom h-[14px] group-hover:scale-y-100 group-active:scale-y-100 group-focus:scale-y-100 bg-primary z-50 ${active ? 'scale-y-100' : 'scale-y-0'}`}/>
        </a>
    </ConditionalWrapper>;
}
