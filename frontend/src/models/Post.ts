export interface Post {
    title: string;
    slug: string;
    publishedAt: string;
    author: string;
    afdeling: null | {
        name: string;
        slug: string;
    };
    banner: null | string;
}

export interface PostDetail {
    title: string;
    content: string;
    slug: string;
    createdAt: string;
    updatedAt: string;
    publishedAt: string;
    author: string;
    afdeling: null | {
        name: string;
        slug: string;
    };
    banner: null | string;
}
