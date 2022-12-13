import path from "path";

export default function joinPaths(...args: string[]) {
    return path.posix.join(...args).replace(":/", "://");
}
