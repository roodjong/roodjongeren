import {StrapiPagination} from '../models/strapi';
import {ReactNode, useCallback} from 'react';
import {FaEllipsisH} from 'react-icons/fa';

interface Props {
    pagination: StrapiPagination;
    pageItems: number;
    children: ReactNode;
    onChangePage: (page: number) => void;
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
        <div className="flex justify-between">
            <div className="text-faded">
                {props.pageItems === 0
                    ? <p>Geen items</p>
                    : <p>Toont {firstItemIndex + 1} tot {lastItemIndex} van de {pagination.total}</p>}
            </div>
            <div className="flex gap-2 items-end">
                {leftPageIndex !== 1 && <PageButton page={1} onChangePage={props.onChangePage}/>}
                {leftPageIndex > 2 && <FaEllipsisH className="text-xs"/>}
                {navigationPages.map(it => <PageButton key={it} onChangePage={props.onChangePage} page={it} active={it === pagination.page}/>)}
                {rightPageIndex < pagination.pageCount - 2 && <FaEllipsisH className="text-xs"/>}
                {rightPageIndex !== pagination.pageCount && <PageButton onChangePage={props.onChangePage} page={pagination.pageCount}/>}
            </div>
        </div>
        {props.children}
    </div>;
}

function PageButton({page, active, onChangePage}: { page: number, active?: boolean, onChangePage: (page: number) => void }) {
    const handleClick = useCallback(() => {
        onChangePage(page);
    }, [page, onChangePage]);
    
    return <button
        className={`flex items-center justify-center h-8 w-8 rounded hover:text-white hover:bg-primary transition-colors ${active ? 'bg-primary text-white' : ''}`}
        onClick={handleClick}>
        {page}
    </button>;
}
