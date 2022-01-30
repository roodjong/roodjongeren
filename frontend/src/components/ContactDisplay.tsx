import {FaAt, FaPhone} from 'react-icons/fa';
import {IconContext} from 'react-icons';

interface Props {
    header: string;
    name?: string;
    email: string;
    phone?: string;
}

export default function ContactDisplay(props: Props) {
    return <div className="p-4 flex flex-col gap-2 shadow-inner bg-gray-50">
        <IconContext.Provider value={{className: 'inline mr-2 origin-center group-hover:scale-125 transition-transform'}}>
            <h2 className="font-title font-bold text-2xl">{props.header}</h2>
            {props.name && <p>{props.name}</p>}
            <a className="group text-primary hover:underline" href={`mailto:${props.email}`}>
                <FaAt/>{props.email}
            </a>
            {props.phone &&
                <a className="group text-primary hover:underline"
                   href={`tel:${props.phone}`}>
                    <FaPhone/>{props.phone
                }</a>}
        </IconContext.Provider>
    </div>;
}
