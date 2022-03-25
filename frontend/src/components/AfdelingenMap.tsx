import {MapContainer, TileLayer} from 'react-leaflet';
import 'leaflet/dist/leaflet.css';
import 'leaflet-defaulticon-compatibility/dist/leaflet-defaulticon-compatibility.css';
import 'leaflet-defaulticon-compatibility';
import AfdelingMarker from './AfdelingMarker';
import Afdeling from '../models/Afdeling';

interface Props {
    compact?: boolean;
    afdelingen: Afdeling[];
}

export default function AfdelingenMap(props: Props) {
    return <MapContainer center={[52.1, 5.3]}
                         zoom={props.compact ? 7 : 8}
                         scrollWheelZoom={false}
                         className={props.compact ? 'h-[32rem] !bg-secondary' : 'h-[52rem]'}>
        <TileLayer url="https://tiles.stadiamaps.com/tiles/alidade_smooth_dark/{z}/{x}/{y}{r}.png"/>
        {props.afdelingen.map(it => <AfdelingMarker key={it.slug} afdeling={it}/>)}
    </MapContainer>;
}
