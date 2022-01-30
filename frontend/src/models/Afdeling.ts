export interface Afdeling {
    name: string;
    slug: string;
    longitude: number;
    latitude: number;
    email: string;
    twitterLink: string | null;
    facebookLink: string | null;
    instagramLink: string | null;
    contactpersoon: null | {
        firstname: string;
        lastname: string;
    };
}

export default interface AfdelingDetail {
    name: string;
    slug: string;
    longitude: number;
    latitude: number;
    email: string;
    twitterLink: string | null;
    facebookLink: string | null;
    instagramLink: string | null;
    contactpersoon: null | {
        firstname: string;
        lastname: string;
        phone: string | null;
    };
    banner: string | null;
    about: string;
}