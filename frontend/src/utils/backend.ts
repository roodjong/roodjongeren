import axios from "axios";
import { StrapiListResponse, StrapiPagination, StrapiResponse } from "../models/strapi";
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
import WorkgroupPageContent from "../models/WorkgroupPageContent";
import { Boardmember } from "../models/Boardmember";
import {
    pickLargestMediaFormatUrl,
    unwrapEntity,
    unwrapFirstEntity,
    unwrapList,
    unwrapMediaFormats,
    unwrapMediaUrl,
    unwrapPagination,
    unwrapRelation,
    unwrapRelationWithId,
} from "./strapi-response";

export const backendBaseUrl =
    process.env.BACKEND_URL ?? process.env.NEXT_PUBLIC_BACKEND_URL ?? "";

export const backend = axios.create({
    baseURL: joinPaths(backendBaseUrl, "/api"),
    paramsSerializer: {
        serialize: (params) => qs.stringify(params, { arrayFormat: "indices" }),
    },
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

    const content = unwrapEntity(response);
    return {
        // `pageBanner` is typed as `string` but is nullable at runtime when
        // no fallback banner is set in Strapi. Fixing the type cascades into
        // `Banner` and every page that reads `pageBanner`, so the cast stays
        // until that wider cleanup happens.
        pageBanner: unwrapMediaUrl(content.pageBanner) as string,
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

    const content = unwrapEntity<any>(response);
    content.banner = unwrapMediaUrl(content.banner);
    return content;
}

export async function fetchAboutUs(): Promise<AboutUsContent> {
    const response = await backend.get<StrapiResponse<AboutUsContent>>("/about-us", {
        params: {
            populate: {
                banner: {
                    fields: ["url"],
                },
            },
        },
    });

    const content = unwrapEntity<any>(response);
    content.banner = unwrapMediaUrl(content.banner);
    return content;
}

export async function fetchBoardmembers(): Promise<Boardmember[]> {
    const response = await backend.get<StrapiListResponse<Boardmember>>("/boardmembers", {
        params: {
            sort: "order",
            populate: {
                photo: {
                    fields: ["url"],
                },
            },
        },
    });

    return unwrapList<any>(response).map((boardmember) => {
        boardmember.photo = unwrapMediaUrl(boardmember.photo);
        return boardmember;
    });
}

export async function fetchProgram(): Promise<ProgramContent> {
    const response = await backend.get<StrapiResponse<ProgramContent>>("/program", {
        params: {
            populate: {
                banner: {
                    fields: ["url"],
                },
            },
        },
    });

    const content = unwrapEntity<any>(response);
    content.banner = unwrapMediaUrl(content.banner);
    return content;
}

export async function fetchJoinUs(): Promise<JoinUsContent> {
    const response = await backend.get<StrapiResponse<JoinUsContent>>("/join-us", {
        params: {
            populate: {
                banner: {
                    fields: ["url"],
                },
            },
        },
    });

    const content = unwrapEntity<any>(response);
    content.banner = unwrapMediaUrl(content.banner);
    return content;
}

export async function fetchSupportUs(): Promise<SupportUsContent> {
    const response = await backend.get<StrapiResponse<SupportUsContent>>("/support-us", {
        params: {
            populate: {
                banner: {
                    fields: ["url"],
                },
            },
        },
    });

    const content = unwrapEntity<any>(response);
    content.banner = unwrapMediaUrl(content.banner);
    return content;
}

export async function fetchPrivacybeleid(): Promise<PrivacybeleidContent> {
    const response = await backend.get<StrapiResponse<PrivacybeleidContent>>(
        "/privacybeleid"
    );
    return unwrapEntity(response);
}

export async function fetchAfdelingen(): Promise<Afdeling[]> {
    const response = await backend.get<StrapiListResponse<Afdeling>>("/afdelingen", {
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
    });
    return unwrapList(response);
}

export async function fetchAfdeling(slug: string): Promise<AfdelingDetail> {
    const response = await backend.get<StrapiListResponse<Afdeling>>("/afdelingen", {
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
    });

    const afdeling = unwrapFirstEntity<any>(response);
    if (!afdeling) {
        throw new Error(`Afdeling not found: ${slug}`);
    }
    afdeling.banner = unwrapMediaUrl(afdeling.banner);
    return afdeling;
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
        slugs: unwrapList(response).map((it) => it.slug),
        pagination: unwrapPagination(response),
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

    const posts = unwrapList<any>(response).map((post): Post => {
        post.afdeling = unwrapRelation(post.afdeling);
        post.banner = pickLargestMediaFormatUrl(unwrapMediaFormats(post.banner));
        return post;
    });

    return {
        posts,
        pagination: unwrapPagination(response),
    };
}

export async function fetchAuthors(): Promise<string[]> {
    const response = await backend.get<StrapiListResponse<Post>>("/posts", {
        params: {
            sort: "author:asc",
            fields: ["author"],
        },
    });

    const uniqueAuthors = new Set(unwrapList(response).map((it) => it.author));
    return [...uniqueAuthors];
}

export async function fetchPost(slug: string): Promise<PostDetail> {
    const response = await backend.get<StrapiListResponse<PostDetail>>("/posts", {
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
    });

    const post = unwrapFirstEntity<any>(response);
    if (!post) {
        throw new Error(`Post not found: ${slug}`);
    }
    post.afdeling = unwrapRelation(post.afdeling);
    post.banner = unwrapMediaUrl(post.banner);
    const petitionRef = unwrapRelationWithId<unknown>(post.petition);
    if (petitionRef) {
        post.petition = await fetchPetition(petitionRef.id);
    }
    return post;
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

    const content = unwrapEntity<any>(response);
    content.banner = unwrapMediaUrl(content.banner);
    return content;
}

export async function fetchConfidants(): Promise<Confidant[]> {
    const response = await backend.get<StrapiListResponse<Confidant>>("/confidants", {
        params: {
            sort: "name",
            populate: {
                photo: {
                    fields: ["url"],
                },
            },
        },
    });

    return unwrapList<any>(response).map((confidant) => {
        confidant.photo = unwrapMediaUrl(confidant.photo);
        return confidant;
    });
}

export async function fetchWorkgroupsPage(): Promise<WorkgroupPageContent> {
    const response = await backend.get<StrapiResponse<WorkgroupPageContent>>(
        "/workgroups-page",
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

    const content = unwrapEntity<any>(response);
    content.banner = unwrapMediaUrl(content.banner);
    return content;
}

export async function fetchWorkgroups(): Promise<Workgroup[]> {
    const response = await backend.get<StrapiListResponse<Workgroup>>("/workgroups", {
        params: {
            sort: "name",
        },
    });

    return unwrapList(response);
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
        slugs: unwrapList(response).map((it) => it.slug),
        pagination: unwrapPagination(response),
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
    const response = await backend.post<{ existed: boolean }>("/petition-signatures", {
        petitionId: petition.id,
        name,
        email,
        questionAnswers,
    });
    return response.data;
}
