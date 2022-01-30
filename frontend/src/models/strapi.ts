export interface StrapiListResponse<T> {
    data: StrapiCollection<T>[],
    meta: {
        pagination: StrapiPagination
    };
}

export interface StrapiResponse<T> {
    data: StrapiCollection<T>,
    meta: {};
}

export interface StrapiCollection<T> {
    id: number;
    attributes: T;
}

export interface StrapiPagination {
    page: number;
    pageSize: number;
    pageCount: number;
    total: number;
}

export interface StrapiImage {
    url: string;
    width: number;
    height: number;
    
}