export default function SkipToContent() {
    
    return <a className="fixed top-2 left-0 bg-primary transition-transform z-[3000] text-white p-2 shadow-lg -translate-x-full focus:translate-x-0"
              href="#main-content" tabIndex={0}>
        Naar de inhoud
    </a>;
}