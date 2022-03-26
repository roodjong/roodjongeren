import {StrapiPagination} from '../models/strapi';
import {ReactNode} from 'react';
import {FaEllipsisH} from 'react-icons/fa';
import Link from 'next/link';

interface Props {
    pagination: StrapiPagination;
    pageItems: number;
    urlPrefix: string;
    children: ReactNode;
}

const navigationRange = 3;

export default function CollectionViewer(props: Props) {
    const pagination = props.pagination;
    
    const firstItemIndex = (pagination.page - 1) * pagination.pageSize;
    const lastItemIndex = firstItemIndex + props.pageItems;
    
    const leftPageIndex = Math.max(pagination.page - navigationRange, 1);
    const rightPageIndex = Math.min(pagination.page + navigationRange, pagination.pageCount);
    const navigationPages = [...Array(rightPageIndex - leftPageIndex + 1).keys()].map(it => it + leftPageIndex);
    
    return <div>
        {props.children}
        <div className="flex justify-between">
            <div className="text-faded">
                {props.pageItems === 0
                    ? <p>Geen items</p>
                    : <p>Toont {firstItemIndex + 1} tot {lastItemIndex} van de {pagination.total}</p>}
            </div>
            <div className="flex gap-2 items-end">
                {leftPageIndex !== 1 && <PageButton urlPrefix={props.urlPrefix} page={1}/>}
                {leftPageIndex > 2 && <FaEllipsisH className="text-xs"/>}
                {navigationPages.map(it => <PageButton key={it} urlPrefix={props.urlPrefix} page={it} active={it === pagination.page}/>)}
                {rightPageIndex < pagination.pageCount - 2 && <FaEllipsisH className="text-xs"/>}
                {rightPageIndex !== pagination.pageCount && <PageButton urlPrefix={props.urlPrefix} page={pagination.pageCount}/>}
            </div>
        </div>
    </div>;
}

function PageButton({urlPrefix, page, active}: { urlPrefix: string, page: number, active?: boolean }) {
    return <Link href={urlPrefix + page}>
        <a className={`flex items-center justify-center h-8 w-8 rounded hover:text-white hover:bg-primary transition-colors ${active ? 'bg-primary text-white' : ''}`}>
            {page}
        </a>
    </Link>;
}
