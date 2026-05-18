import { AxiosResponse } from "axios";
import {
    StrapiListResponse,
    StrapiMediaField,
    StrapiMediaFormats,
    StrapiPagination,
    StrapiRelationField,
    StrapiResponse,
} from "../models/strapi";

// Re-exported so a fetcher only needs to import from one place to both type
// a raw Strapi response and unwrap it.
export type {
    StrapiMediaField,
    StrapiMediaFormats,
    StrapiRelationField,
    WithRawMedia,
    WithRawRelation,
} from "../models/strapi";

export function unwrapEntity<T>(res: AxiosResponse<StrapiResponse<T>>): T {
    return res.data.data.attributes;
}

export function unwrapList<T>(res: AxiosResponse<StrapiListResponse<T>>): T[] {
    return res.data.data.map((it) => it.attributes);
}

export function unwrapFirstEntity<T>(
    res: AxiosResponse<StrapiListResponse<T>>
): T | null {
    const first = res.data.data[0];
    return first ? first.attributes : null;
}

export function unwrapPagination(
    res: AxiosResponse<StrapiListResponse<unknown>>
): StrapiPagination {
    return res.data.meta.pagination;
}

export function unwrapMediaUrl(field: StrapiMediaField): string | null {
    return field?.data?.attributes?.url ?? null;
}

export function unwrapMediaFormats(field: StrapiMediaField): StrapiMediaFormats | null {
    return field?.data?.attributes?.formats ?? null;
}

export function pickLargestMediaFormatUrl(
    formats: StrapiMediaFormats | null
): string | null {
    if (!formats) return null;
    return (
        formats.large?.url ??
        formats.medium?.url ??
        formats.small?.url ??
        formats.thumbnail?.url ??
        null
    );
}

export function unwrapRelation<T>(field: StrapiRelationField<T>): T | null {
    return field?.data?.attributes ?? null;
}

export function unwrapRelationWithId<T>(
    field: StrapiRelationField<T>
): (T & { id: number }) | null {
    const data = field?.data;
    if (!data) return null;
    return { ...data.attributes, id: data.id };
}
