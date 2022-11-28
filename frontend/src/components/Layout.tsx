import { ReactNode } from "react";
import Header from "./header/Header";
import Footer from "./Footer";

interface Props {
    children: ReactNode;
}

export default function Layout(props: Props) {
    return (
        <div className="flex flex-col min-h-screen text-regular text-base font-sans bg-white">
            <Header />
            <main className="flex-grow">{props.children}</main>
            <Footer />
        </div>
    );
}
