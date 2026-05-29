import React, { ReactNode, useCallback, useEffect, useId, useRef, useState } from "react";
import { FaCaretDown } from "react-icons/fa";
import { useRouter } from "next/router";

interface Props {
    title: string;
    children: ReactNode;
}

export default function HeaderDropdown(props: Props) {
    const router = useRouter();
    const [isOpen, setOpen] = useState<boolean>(false);

    const wrapperRef = useRef<HTMLDivElement | null>(null);
    const panelId = useId();
    const handleToggleMenu = useCallback(
        () => setOpen((prevState) => !prevState),
        [setOpen]
    );

    useEffect(() => {
        setOpen(false);
    }, [router.pathname]);

    useEffect(() => {
        if (!isOpen) return;
        const handleClickOutside = (e: MouseEvent) => {
            const target = e.target as Node | null;
            if (target && !wrapperRef.current?.contains(target)) {
                setOpen(false);
            }
        };
        const handleKey = (e: KeyboardEvent) => {
            if (e.key === "Escape") setOpen(false);
        };
        window.addEventListener("click", handleClickOutside);
        window.addEventListener("keydown", handleKey);
        return () => {
            window.removeEventListener("click", handleClickOutside);
            window.removeEventListener("keydown", handleKey);
        };
    }, [isOpen]);

    const handleBlur = useCallback((e: React.FocusEvent<HTMLDivElement>) => {
        if (!e.currentTarget.contains(e.relatedTarget as Node | null)) {
            setOpen(false);
        }
    }, []);

    return (
        <div className="flex flex-col grow" ref={wrapperRef} onBlur={handleBlur}>
            <button
                type="button"
                className="flex relative grow items-center justify-center p-4 cursor-pointer whitespace-nowrap group text-4xl font-title focus-visible:outline-2 focus-visible:outline-primary"
                onClick={handleToggleMenu}
                aria-expanded={isOpen}
                aria-controls={panelId}
                aria-haspopup="true"
            >
                <span>
                    {props.title}
                    <FaCaretDown
                        aria-hidden="true"
                        className={`inline ml-2 transition-transform ${
                            isOpen ? "rotate-180" : "rotate-0"
                        }`}
                    />
                </span>
                <div
                    aria-hidden="true"
                    className="absolute bottom-0 transition-transform w-full origin-bottom h-[14px] group-hover:scale-y-100 group-active:scale-y-100 bg-primary z-50 scale-y-0"
                />
            </button>
            <div
                id={panelId}
                className={`lg:absolute inner-shadow bg-white overflow-hidden transition-all top-[calc(100%+1rem)] ${
                    isOpen ? "max-h-screen" : "max-h-0"
                }`}
            >
                <div className="lg:p-4 shadow-inner bg-gray-50">{props.children}</div>
            </div>
        </div>
    );
}
