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
    type: PostType;
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
    type: PostType;
}

export enum PostType {
    NEWS = 'nieuws',
    SUBMISSION = 'inzending'
}

export function postTypeToText(postType: PostType) {
    switch (postType) {
        case PostType.NEWS:
            return 'Nieuwsbericht';
        case PostType.SUBMISSION:
            return 'Inzending';
    }
}