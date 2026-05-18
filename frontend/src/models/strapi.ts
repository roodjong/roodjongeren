export interface StrapiListResponse<T> {
    data: StrapiCollection<T>[];
    meta: {
        pagination: StrapiPagination;
    };
}

export interface StrapiResponse<T> {
    data: StrapiCollection<T>;
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

export interface StrapiMediaFormats {
    large?: { url: string };
    medium?: { url: string };
    small?: { url: string };
    thumbnail?: { url: string };
}

export type StrapiMediaAttributes = StrapiImage & {
    formats?: StrapiMediaFormats;
};

export type StrapiMediaField =
    | { data: StrapiCollection<StrapiMediaAttributes> | null }
    | undefined
    | null;

export type StrapiRelationField<T> =
    | { data: StrapiCollection<T> | null }
    | undefined
    | null;

/**
 * Models in this folder describe the *sanitised* shape that components consume
 * (e.g. `banner: string`). The Strapi API returns those same fields wrapped in
 * `{ data: { attributes: { url } } }`. `WithRawMedia` rewrites the named keys
 * back to the raw Strapi shape so a fetcher can type the response without
 * `any` and unwrap explicitly:
 *
 *   type HomeContentRaw = WithRawMedia<HomeContent, "banner">;
 *   const raw = unwrapEntity<HomeContentRaw>(response);
 *   return { ...raw, banner: unwrapMediaUrl(raw.banner) };
 */
export type WithRawMedia<T, K extends keyof T> = Omit<T, K> & {
    [P in K]: StrapiMediaField;
};

/**
 * Same idea as `WithRawMedia` but for single relations — rewrites the named
 * keys to the raw `{ data: { attributes } }` relation shape.
 */
export type WithRawRelation<T, K extends keyof T, R> = Omit<T, K> & {
    [P in K]: StrapiRelationField<R>;
};
