import ReactMarkdown from "react-markdown";
import Subheader from "../components/Subheader";
import { PropsWithChildren } from "react";
import {
    HeadingProps,
    OrderedListProps,
    UnorderedListProps,
} from "react-markdown/lib/ast-to-react";
import { FaQuoteLeft } from "react-icons/fa";
import remarkGfm from "remark-gfm";

interface Props {
    content: string;
}

export default function Markdown(props: Props) {
    return (
        <div className="overflow-hidden">
            <ReactMarkdown
                remarkPlugins={[remarkGfm]}
                includeElementIndex
                components={{
                    h1: MarkdownHeader1,
                    h2: MarkdownHeader2,
                    h3: MarkdownHeader3,
                    blockquote: MarkdownBlockquote,
                    ul: MarkdownUnorderedList,
                    ol: MarkdownOrderedList,
                    a: MarkdownAnchor,
                    img: MarkdownImage,
                    p: MarkdownParagraph,
                    th: MarkdownTableHead,
                    td: MarkdownTableData,
                }}
            >
                {props.content}
            </ReactMarkdown>
        </div>
    );
}

function MarkdownHeader1(props: PropsWithChildren<HeadingProps>) {
    return <Subheader>{props.children}</Subheader>;
}

function MarkdownHeader2(props: PropsWithChildren<HeadingProps>) {
    return <h3 className="my-4 font-title font-bold text-3xl">{props.children}</h3>;
}

function MarkdownHeader3(props: PropsWithChildren<HeadingProps>) {
    return <h4 className="my-4 font-title font-bold text-2xl">{props.children}</h4>;
}

function MarkdownBlockquote(props: PropsWithChildren<any>) {
    return (
        <div className="italic border-l-4 border-l-gray-300 pl-5 text-lg relative ml-1">
            <FaQuoteLeft className="-mb-2 inline absolute top-1/2 left-0 bg-white -translate-y-1/2 -translate-x-1/2 border-white border-4 box-content text-faded text-base" />
            {props.children}
        </div>
    );
}

function MarkdownUnorderedList(props: PropsWithChildren<UnorderedListProps>) {
    return <ul className="list-inside list-star my-4 space-y-4">{props.children}</ul>;
}

function MarkdownOrderedList(props: PropsWithChildren<OrderedListProps>) {
    return <ol className="list-inside list-decimal my-4 space-y-4">{props.children}</ol>;
}

function MarkdownAnchor(props: PropsWithChildren<any>) {
    return (
        <a href={props.href} className="text-primary underline hover:cursor-pointer my-4">
            {props.children}
        </a>
    );
}

function MarkdownImage(props: PropsWithChildren<any>) {
    return (
        <span>
            <img
                src={props.src}
                alt={props.alt}
                className="md:float-right md:ml-4 md:max-w-[50%] clear-both mb-4 shadow shadow-[#0004]"
            />
        </span>
    );
}

function MarkdownParagraph(props: PropsWithChildren<any>) {
    return <p className="my-4">{props.children}</p>;
}

function MarkdownTableHead(props: PropsWithChildren<any>) {
    return <th className="pr-4 last:pr-0 text-left">{props.children}</th>;
}

function MarkdownTableData(props: PropsWithChildren<any>) {
    return <td className="pr-4 last:pr-0">{props.children}</td>;
}
