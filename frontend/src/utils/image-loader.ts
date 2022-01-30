import {ImageLoaderProps} from 'next/image';
import {backendBaseUrl} from './backend';
import joinPaths from './paths';

export default function imageLoader(props: ImageLoaderProps): string {
    return joinPaths(backendBaseUrl, props.src);
}