import {ChangeEvent, useState} from 'react';
import {FaSearch, FaSpinner} from 'react-icons/fa';

interface Props {
    placeholder: string;
    isLoading?: boolean;
    onChange: (text: string) => void;
}

const DEBOUNCE_TIME_MS = 250;

export default function Search(props: Props) {
    const [value, setValue] = useState('');
    const [timeoutId, setTimeoutId] = useState<NodeJS.Timeout | undefined>(undefined);
    
    function handleOnChange(e: ChangeEvent<HTMLInputElement>) {
        const newValue = e.target.value;
        setValue(newValue);
        
        clearTimeout(timeoutId);
        const newTimeoutId = setTimeout(() => {
            props.onChange(newValue);
            setTimeoutId(undefined);
        }, DEBOUNCE_TIME_MS);
        setTimeoutId(newTimeoutId);
    }
    
    return <div className="relative text-gray-600  text-lg focus-within:text-gray-400 leading-tight mb-4">
        <div className="absolute top-1/2 left-3 -translate-y-1/2">
            {props.isLoading || timeoutId !== undefined ? <FaSpinner className="animate-spin"/> : <FaSearch/>}
        </div>
        <input type="search"
               className="shadow appearance-none border rounded w-full p-3 pl-10 focus:outline-none focus:shadow-outline"
               placeholder={props.placeholder} value={value} onChange={handleOnChange}/>
    </div>;
}
