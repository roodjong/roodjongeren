import {FaPhone} from 'react-icons/fa';
import {IconContext} from 'react-icons';
import {Afdeling} from '../models/Afdeling';

interface Props {
    afdeling: Afdeling;
}

export default function ContactDisplay(props: Props) {
    return <div className="p-4 flex flex-col gap-2 shadow-inner bg-gray-50">
        <IconContext.Provider value={{className: 'inline mr-2 origin-center group-hover:scale-125 transition-transform'}}>
            <h2 className="font-title font-bold text-2xl">Contactpersoon(nen)</h2>
            <div className="divide-y divide-solid">
                {props.afdeling.contactpersonen.map((contactpersoon, i) =>
                    <div key={i} className="py-2 last:pb-0 first:pt-0">
                        <p>{contactpersoon.firstname} {contactpersoon.lastname}</p>
                        {contactpersoon.phone &&
                            <a className="group text-primary hover:underline"
                               href={`tel:${contactpersoon.phone}`}>
                                <FaPhone/>{contactpersoon.phone
                            }</a>}
                    </div>)}
                {props.afdeling.contactpersonen.length === 0 && <i className="text-faded">Geen</i>}
            </div>
        </IconContext.Provider>
    </div>;
}
