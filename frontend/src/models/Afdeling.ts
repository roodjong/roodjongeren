export interface Afdeling {
    name: string;
    slug: string;
    longitude: number;
    latitude: number;
    email: string;
    twitterLink: string | null;
    facebookLink: string | null;
    instagramLink: string | null;
    contactpersonen: Contactpersoon[];
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
    contactpersonen: Contactpersoon[];
    banner: string | null;
    about: string;
}

export interface Contactpersoon {
    firstname: string;
    lastname: string;
    phone: string | null;
}
