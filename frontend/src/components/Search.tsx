import { ChangeEvent, useEffect, useRef, useState } from "react";
import { FaSearch, FaSpinner } from "react-icons/fa";

interface Props {
    value: string;
    placeholder: string;
    isLoading?: boolean;
    onChange: (text: string) => void;
}

const DEBOUNCE_TIME_MS = 250;

export default function Search(props: Props) {
    const [value, setValue] = useState(props.value);
    const [isDebouncing, setIsDebouncing] = useState(false);
    const timeoutRef = useRef<ReturnType<typeof setTimeout> | null>(null);

    useEffect(() => {
        setValue(props.value);
        if (timeoutRef.current) {
            clearTimeout(timeoutRef.current);
            timeoutRef.current = null;
            setIsDebouncing(false);
        }
    }, [props.value]);

    useEffect(
        () => () => {
            if (timeoutRef.current) {
                clearTimeout(timeoutRef.current);
            }
        },
        []
    );

    function handleOnChange(e: ChangeEvent<HTMLInputElement>) {
        const newValue = e.target.value;
        setValue(newValue);

        if (timeoutRef.current) {
            clearTimeout(timeoutRef.current);
        }
        setIsDebouncing(true);
        timeoutRef.current = setTimeout(() => {
            timeoutRef.current = null;
            props.onChange(newValue);
            setIsDebouncing(false);
        }, DEBOUNCE_TIME_MS);
    }

    return (
        <div className="relative text-gray-600  text-lg focus-within:text-gray-400 leading-tight mb-4">
            <div className="absolute top-1/2 left-3 -translate-y-1/2">
                {props.isLoading || isDebouncing ? (
                    <FaSpinner className="animate-spin" />
                ) : (
                    <FaSearch />
                )}
            </div>
            <input
                type="search"
                className="shadow appearance-none border rounded w-full p-3 pl-10 focus:outline-none focus:shadow-outline"
                placeholder={props.placeholder}
                value={value}
                onChange={handleOnChange}
            />
        </div>
    );
}
