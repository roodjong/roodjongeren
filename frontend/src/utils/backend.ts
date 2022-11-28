import axios from "axios";
import {
    StrapiListResponse,
    StrapiPagination,
    StrapiResponse,
} from "../models/strapi";
import Afdeling from "../models/Afdeling";
import AfdelingDetail from "../models/Afdeling";
import AboutUsContent from "../models/AboutUsContent";
import PrivacybeleidContent from "../models/PrivacybeleidContent";
import qs from "qs";
import { Post, PostDetail, PostType } from "../models/Post";
import HomeContent from "../models/HomeContent";
import JoinUsContent from "../models/JoinUsContent";
import SupportUsContent from "../models/SupportUsContent";
import { Confidant } from "../models/Confidant";
import ConfidantsPageContent from "../models/ConfidantsPageContent";
import { Workgroup } from "../models/Workgroup";
import joinPaths from "./paths";
import ProgramContent from "../models/ProgramContent";
import Fallback from "../models/Fallback";
import { PetitionDetail } from "../models/Petition";

export const backendBaseUrl =
    process.env.BACKEND_URL ?? process.env.NEXT_PUBLIC_BACKEND_URL ?? "";

export const backend = axios.create({
    baseURL: joinPaths(backendBaseUrl, "/api"),
    paramsSerializer: (params) => qs.stringify(params),
});

export async function fetchFallback(): Promise<Fallback> {
    const response = await backend.get<StrapiResponse<any>>("/fallback", {
        params: {
            populate: {
                pageBanner: {
                    fields: ["url"],
                },
            },
        },
    });

    const content = response.data.data.attributes;

    return {
        pageBanner: content.pageBanner.data.attributes?.url ?? null,
    };
}

export async function fetchHome(): Promise<HomeContent> {
    const response = await backend.get<StrapiResponse<HomeContent>>("/home", {
        params: {
            populate: {
                banner: {
                    fields: ["url"],
                },
            },
        },
    });

    function sanitise(content: any) {
        content.banner = content.banner.data?.attributes?.url ?? null;
        return content;
    }

    return sanitise(response.data.data.attributes);
}

export async function fetchAboutUs(): Promise<AboutUsContent> {
    const response = await backend.get<StrapiResponse<AboutUsContent>>(
        "/about-us",
        {
            params: {
                populate: {
                    banner: {
                        fields: ["url"],
                    },
                },
            },
        }
    );

    function sanitise(content: any) {
        content.banner = content.banner.data.attributes.url;
        return content;
    }

    return sanitise(response.data.data.attributes);
}

export async function fetchProgram(): Promise<ProgramContent> {
    const response = await backend.get<StrapiResponse<ProgramContent>>(
        "/program",
        {
            params: {
                populate: {
                    banner: {
                        fields: ["url"],
                    },
                },
            },
        }
    );

    function sanitise(content: any) {
        content.banner = content.banner.data.attributes.url;
        return content;
    }

    return sanitise(response.data.data.attributes);
}

export async function fetchJoinUs(): Promise<JoinUsContent> {
    const response = await backend.get<StrapiResponse<JoinUsContent>>(
        "/join-us",
        {
            params: {
                populate: {
                    banner: {
                        fields: ["url"],
                    },
                },
            },
        }
    );

    function sanitise(content: any) {
        content.banner = content.banner.data.attributes.url;
        return content;
    }

    return sanitise(response.data.data.attributes);
}

export async function fetchSupportUs(): Promise<SupportUsContent> {
    const response = await backend.get<StrapiResponse<SupportUsContent>>(
        "/support-us",
        {
            params: {
                populate: {
                    banner: {
                        fields: ["url"],
                    },
                },
            },
        }
    );

    function sanitise(content: any) {
        content.banner = content.banner.data.attributes.url;
        return content;
    }

    return sanitise(response.data.data.attributes);
}

export async function fetchPrivacybeleid(): Promise<PrivacybeleidContent> {
    const response = await backend.get<StrapiResponse<PrivacybeleidContent>>(
        "/privacybeleid"
    );
    return response.data.data.attributes;
}

export async function fetchAfdelingen(): Promise<Afdeling[]> {
    const response = await backend.get<StrapiListResponse<Afdeling>>(
        "/afdelingen",
        {
            params: {
                sort: "name",
                fields: [
                    "name",
                    "slug",
                    "longitude",
                    "latitude",
                    "email",
                    "twitterLink",
                    "facebookLink",
                    "instagramLink",
                ],
            },
        }
    );
    return response.data.data.map((it) => it.attributes);
}

export async function fetchAfdeling(slug: string): Promise<AfdelingDetail> {
    const response = await backend.get<StrapiListResponse<Afdeling>>(
        "/afdelingen",
        {
            params: {
                filters: {
                    slug: { $eq: slug },
                },
                populate: {
                    banner: {
                        fields: "*",
                    },
                },
            },
        }
    );

    function sanitise(afdeling: any): Afdeling {
        afdeling.banner = afdeling.banner.data?.attributes?.url ?? null;
        return afdeling;
    }

    return sanitise(response.data.data[0].attributes);
}

export async function fetchPostSlugs(): Promise<{
    slugs: string[];
    pagination: StrapiPagination;
}> {
    const response = await backend.get<StrapiListResponse<Post>>("/posts", {
        params: {
            sort: "publishedAt:desc",
            fields: "slug",
        },
    });

    return {
        slugs: response.data.data.map((it) => it.attributes.slug),
        pagination: response.data.meta.pagination,
    };
}

export async function fetchPosts(
    type: PostType | null = null,
    author: string | null = null,
    afdeling: string | null = null,
    page: number = 1,
    pageSize: number = 8,
    frontpage: boolean | null = null,
    searchString: string | null = null
): Promise<{ posts: Post[]; pagination: StrapiPagination }> {
    const response = await backend.get<StrapiListResponse<Post>>("/posts", {
        params: {
            sort: "publishedAt:desc",
            pagination: {
                page,
                pageSize,
            },
            fields: ["title", "slug", "publishedAt", "author", "type"],
            populate: {
                afdeling: {
                    fields: ["name", "slug"],
                },
                banner: {
                    fields: ["formats"],
                },
            },
            filters: {
                author: author ? { $eq: author } : undefined,
                afdeling: afdeling
                    ? {
                          slug: { $eq: afdeling },
                      }
                    : undefined,
                type: type ?? undefined,
                frontpage: frontpage === null ? undefined : frontpage,
                $or: [
                    {
                        title: {
                            $containsi: searchString,
                        },
                    },
                    {
                        author: {
                            $containsi: searchString,
                        },
                    },
                    {
                        content: {
                            $containsi: searchString,
                        },
                    },
                ],
            },
        },
    });

    function sanitise(post: any): Post {
        post.afdeling = post.afdeling.data?.attributes ?? null;
        const formats = post.banner.data?.attributes?.formats;
        const format = formats?.large ?? formats?.small ?? formats?.thumbnail;
        post.banner = format?.url ?? null;
        return post;
    }

    return {
        posts: response.data.data.map((it) => sanitise(it.attributes)),
        pagination: response.data.meta.pagination,
    };
}

export async function fetchAuthors(): Promise<string[]> {
    const response = await backend.get<StrapiListResponse<Post>>("/posts", {
        params: {
            sort: "author:asc",
            fields: ["author"],
        },
    });

    const uniqueAuthors = new Set(
        response.data.data.map((it) => it.attributes.author)
    );

    return [...uniqueAuthors];
}

export async function fetchPost(slug: string): Promise<PostDetail> {
    const response = await backend.get<StrapiListResponse<PostDetail>>(
        "/posts",
        {
            params: {
                filters: {
                    slug: { $eq: slug },
                },
                populate: {
                    afdeling: {
                        fields: ["name", "slug"],
                    },
                    banner: {
                        fields: ["url"],
                    },
                    petition: {
                        fields: ["id"],
                    },
                },
            },
        }
    );

    async function sanitise(post: any) {
        post.afdeling = post.afdeling.data?.attributes ?? null;
        post.banner = post.banner.data?.attributes?.url ?? null;
        if (post.petition.data) {
            post.petition = await fetchPetition(post.petition.data.id);
        }
        return post;
    }

    return sanitise(response.data.data[0].attributes);
}

export async function fetchConfidantsPage(): Promise<ConfidantsPageContent> {
    const response = await backend.get<StrapiResponse<ConfidantsPageContent>>(
        "/confidants-page",
        {
            params: {
                populate: {
                    banner: {
                        fields: ["url"],
                    },
                },
            },
        }
    );

    function sanitise(content: any) {
        content.banner = content.banner.data.attributes.url;
        return content;
    }

    return sanitise(response.data.data.attributes);
}

export async function fetchConfidants(): Promise<Confidant[]> {
    const response = await backend.get<StrapiListResponse<Confidant>>(
        "/confidants",
        {
            params: {
                sort: "name",
                populate: {
                    photo: {
                        fields: ["url"],
                    },
                },
            },
        }
    );

    function sanitise(confidant: any): Confidant {
        confidant.photo = confidant.photo.data?.attributes?.url ?? null;
        return confidant;
    }

    return response.data.data.map((it) => sanitise(it.attributes));
}

export async function fetchWorkgroups(): Promise<Workgroup[]> {
    const response = await backend.get<StrapiListResponse<Workgroup>>(
        "/workgroups",
        {
            params: {
                sort: "name",
            },
        }
    );

    function sanitise(confidant: any): Workgroup {
        // confidant.photo = confidant.photo.data?.attributes?.url ?? null;
        return confidant;
    }

    return response.data.data.map((it) => sanitise(it.attributes));
}

export async function fetchPetitionSlugs(): Promise<{
    slugs: string[];
    pagination: StrapiPagination;
}> {
    const response = await backend.get<StrapiListResponse<Post>>("/posts", {
        params: {
            filters: {
                type: "petitie",
            },
            sort: "publishedAt:desc",
            fields: "slug",
        },
    });

    return {
        slugs: response.data.data.map((it) => it.attributes.slug),
        pagination: response.data.meta.pagination,
    };
}

export async function fetchPetition(id: number): Promise<PetitionDetail> {
    const response = await backend.get<PetitionDetail>(
        joinPaths("/petitions", id.toString()),
        {}
    );
    return response.data;
}

export async function submitPetitionSignature(
    petition: PetitionDetail,
    name: string,
    email: string,
    questionAnswers: Array<{ question: string; answer: string }>
): Promise<{ existed: boolean }> {
    const response = await backend.post<{ existed: boolean }>(
        "/petition-signatures",
        { petitionId: petition.id, name, email, questionAnswers }
    );
    return response.data;
}
