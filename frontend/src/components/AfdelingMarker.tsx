import { Marker, Popup } from "react-leaflet";
import { Icon } from "leaflet";
import Afdeling from "../models/Afdeling";
import { FaFacebook, FaInstagram, FaTwitter } from "react-icons/fa";
import { IconContext } from "react-icons";
import Link from "next/link";

interface Props {
    afdeling: Afdeling;
}

const icon = new Icon({
    iconUrl: "/images/marker.webp",
    iconSize: [20, 20],
    shadowUrl: "/images/marker-shadow.webp",
    shadowSize: [32, 32],
    shadowAnchor: [16, 13],
});

export default function AfdelingMarker(props: Props) {
    const afdeling = props.afdeling;

    return (
        <Marker
            position={[afdeling.latitude, afdeling.longitude]}
            icon={icon}
            title={afdeling.name}
        >
            <Popup>
                <h2 className="font-title text-3xl font-bold text-regular">
                    {afdeling.name}
                </h2>
                <a
                    className="text-base hover:underline !text-primary"
                    href={`mailto:${afdeling.email}`}
                >
                    {afdeling.email}
                </a>
                <Link
                    href={`/afdelingen/${afdeling.slug}`}
                    className="button-primary block text-2xl !text-white w-full my-3 py-2"
                >
                    Lees meer
                </Link>
                <div className="flex text-base justify-end mt-2 gap-3">
                    <IconContext.Provider
                        value={{
                            className:
                                "!text-primary origin-center hover:scale-125 transition-transform",
                        }}
                    >
                        {afdeling.twitterLink && (
                            <a href={afdeling.twitterLink}>
                                <FaTwitter />
                            </a>
                        )}
                        {afdeling.facebookLink && (
                            <a href={afdeling.facebookLink}>
                                <FaFacebook />
                            </a>
                        )}
                        {afdeling.instagramLink && (
                            <a href={afdeling.instagramLink}>
                                <FaInstagram />
                            </a>
                        )}
                    </IconContext.Provider>
                </div>
            </Popup>
        </Marker>
    );
}
