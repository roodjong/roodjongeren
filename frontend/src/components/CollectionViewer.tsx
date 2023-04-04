import { StrapiPagination } from "../models/strapi";
import { ReactNode, useCallback, useMemo } from "react";
import { FaEllipsisH } from "react-icons/fa";

interface Props {
    pagination: StrapiPagination;
    pageItems: number;
    children: ReactNode;
    onChangePage: (page: number) => void;
}

const navigationRange = 3;

export default function CollectionViewer({
    pagination,
    pageItems,
    children,
    onChangePage,
}: Props) {
    const paginationControls = useMemo(
        () => (
            <PaginationControls
                pagination={pagination}
                pageItems={pageItems}
                onChangePage={onChangePage}
            />
        ),
        [pagination, pageItems, onChangePage]
    );

    return (
        <>
            {paginationControls}
            <div className="my-6">{children}</div>
            {pageItems > 0 && paginationControls}
        </>
    );
}

interface PaginationControlsProps {
    pagination: StrapiPagination;
    pageItems: number;
    onChangePage: (page: number) => void;
}

function PaginationControls({
    pagination,
    pageItems,
    onChangePage,
}: PaginationControlsProps) {
    const firstItemIndex = (pagination.page - 1) * pagination.pageSize;
    const lastItemIndex = firstItemIndex + pageItems;

    const leftPageIndex = Math.max(pagination.page - navigationRange, 1);
    const rightPageIndex = Math.min(
        pagination.page + navigationRange,
        pagination.pageCount
    );
    const navigationPages = [...Array(rightPageIndex - leftPageIndex + 1).keys()].map(
        (it) => it + leftPageIndex
    );

    return (
        <div className="flex flex-col sm:flex-row justify-between items-center sm:items-start gap-2">
            <div className="text-faded">
                {pageItems === 0 ? (
                    <p>Geen posts</p>
                ) : (
                    <p>
                        Toont {firstItemIndex + 1} t/m {lastItemIndex} van de{" "}
                        {pagination.total}
                    </p>
                )}
            </div>
            <div className="flex gap-2 items-end">
                {leftPageIndex !== 1 && (
                    <PageButton page={1} onChangePage={onChangePage} />
                )}
                {leftPageIndex > 2 && <FaEllipsisH className="text-xs" />}
                {navigationPages.map((it) => (
                    <PageButton
                        key={it}
                        onChangePage={onChangePage}
                        page={it}
                        active={it === pagination.page}
                    />
                ))}
                {rightPageIndex < pagination.pageCount - 2 && (
                    <FaEllipsisH className="text-xs" />
                )}
                {rightPageIndex !== pagination.pageCount && (
                    <PageButton onChangePage={onChangePage} page={pagination.pageCount} />
                )}
            </div>
        </div>
    );
}

function PageButton({
    page,
    active,
    onChangePage,
}: {
    page: number;
    active?: boolean;
    onChangePage: (page: number) => void;
}) {
    const handleClick = useCallback(() => {
        onChangePage(page);
    }, [page, onChangePage]);

    return (
        <button
            className={`flex items-center justify-center h-8 w-8 rounded hover:text-white hover:bg-primary transition-colors ${
                active ? "bg-primary text-white" : ""
            }`}
            onClick={handleClick}
        >
            {page}
        </button>
    );
}
