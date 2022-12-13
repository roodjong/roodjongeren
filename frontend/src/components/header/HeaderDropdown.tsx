import React, { ReactNode, useCallback, useEffect, useRef, useState } from "react";
import { FaCaretDown } from "react-icons/fa";
import { useRouter } from "next/router";

interface Props {
    title: string;
    children: ReactNode;
}

export default function HeaderDropdown(props: Props) {
    const router = useRouter();
    const [isOpen, setOpen] = useState<boolean>(false);

    const dropdownRef = useRef<any>(null);
    const handleToggleMenu = useCallback(
        (e: React.MouseEvent) => setOpen((prevState) => !prevState),
        [setOpen]
    );

    const handleFocus = useCallback(() => setOpen(true), [setOpen]);
    const handleBlur = useCallback(() => setOpen(false), [setOpen]);

    useEffect(() => {
        setOpen(false);
    }, [router.pathname]);

    useEffect(() => {
        const handleClickOutside = (e: MouseEvent) => {
            const wasClickedOutsideOfDropdown = !dropdownRef.current?.contains(e.target);
            if (wasClickedOutsideOfDropdown) {
                setOpen(false);
            }
        };
        window.addEventListener("click", handleClickOutside);
        return () => window.removeEventListener("click", handleClickOutside);
    }, [setOpen, dropdownRef]);

    return (
        <div className="flex flex-col grow">
            <div
                className="flex relative grow items-center justify-center relative p-4 cursor-pointer whitespace-nowrap relative group text-4xl font-title"
                onClick={handleToggleMenu}
                ref={dropdownRef}
            >
                <span>
                    {props.title}
                    <FaCaretDown
                        className={`inline ml-2 transition-transform ${
                            isOpen ? "rotate-180" : "rotate-0"
                        }`}
                    />
                </span>
                <div className="absolute bottom-0 transition-transform w-full origin-bottom h-[14px] group-hover:scale-y-100 group-active:scale-y-100 bg-primary z-50 scale-y-0" />
            </div>
            <div
                className={`lg:absolute inner-shadow bg-white overflow-hidden transition-all top-[calc(100%+1rem)] ${
                    isOpen ? "max-h-screen" : "max-h-0"
                }`}
            >
                <div
                    className="lg:p-4 shadow-inner bg-gray-50"
                    onFocus={handleFocus}
                    onBlur={handleBlur}
                >
                    {props.children}
                </div>
            </div>
        </div>
    );
}
