import {StrapiPagination} from '../models/strapi';
import {ReactNode} from 'react';
import {FaEllipsisH} from 'react-icons/fa';
import Link from 'next/link';

interface Props {
    pagination: StrapiPagination;
    pageItems: number;
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
                {leftPageIndex !== 1 && <PageButton page={1}/>}
                {leftPageIndex > 2 && <FaEllipsisH className="text-xs"/>}
                {navigationPages.map(it => <PageButton key={it} page={it} active={it === pagination.page}/>)}
                {rightPageIndex < pagination.pageCount - 2 && <FaEllipsisH className="text-xs"/>}
                {rightPageIndex !== pagination.pageCount && <PageButton page={pagination.pageCount}/>}
            </div>
        </div>
    </div>;
}

function PageButton({page, active}: { page: number, active?: boolean }) {
    return <Link href={`/nieuws/page/${page}`}>
        <a className={`text-center h-6 w-6 rounded hover:text-white hover:bg-primary transition-colors ${active ? 'bg-primary text-white' : ''}`}>
            {page}
        </a>
    </Link>;
}
