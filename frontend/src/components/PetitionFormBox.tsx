import { FormEventHandler, ReactNode } from "react";

interface Props {
    className?: string;
    children: ReactNode;
    onSubmit?: FormEventHandler<HTMLFormElement>;
}

export default function PetitionFormBox(props: Props) {
    return (
        <div className={props.className}>
            <form
                className="bg-primary rounded-2xl p-4 text-white flex flex-col gap-2"
                onSubmit={props.onSubmit}
            >
                {props.children}
            </form>
        </div>
    );
}
