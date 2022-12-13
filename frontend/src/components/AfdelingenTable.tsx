import Afdeling from "../models/Afdeling";
import Table from "./table/Table";
import TableHead from "./table/TableHead";
import TableBody from "./table/TableBody";
import TableRow from "./table/TableRow";
import TableCell from "./table/TableCell";
import Link from "next/link";
import { useRouter } from "next/router";
import TableHeadCell from "./table/TableHeadCell";

interface Props {
    afdelingen: Afdeling[];
}

export default function AfdelingenTable(props: Props) {
    return (
        <Table>
            <TableHead>
                <TableHeadCell>Naam</TableHeadCell>
                <TableHeadCell>Contactpersoon(en)</TableHeadCell>
                <TableHeadCell className="sm:table-cell hidden">E-mail</TableHeadCell>
                <TableHeadCell className="sm:table-cell hidden" />
            </TableHead>
            <TableBody>
                {props.afdelingen.map((afdeling) => (
                    <AfdelingRow key={afdeling.slug} afdeling={afdeling} />
                ))}
            </TableBody>
        </Table>
    );
}

function AfdelingRow({ afdeling }: { afdeling: Afdeling }) {
    const router = useRouter();
    const link = `/afdelingen/${afdeling.slug}`;

    return (
        <TableRow onClick={() => router.push(link)}>
            <TableCell>{afdeling.name}</TableCell>
            <TableCell>
                {afdeling.contactpersonen.length === 0
                    ? "-"
                    : afdeling.contactpersonen.map((contactpersoon, i) => (
                          <p
                              key={i}
                          >{`${contactpersoon.firstname} ${contactpersoon.lastname}`}</p>
                      ))}
            </TableCell>
            <TableCell className="sm:table-cell hidden">
                <a
                    href={`mailto:afdeling.email`}
                    className="hover:underline text-primary"
                    onClick={(e) => e.stopPropagation()}
                >
                    {afdeling.email}
                </a>
            </TableCell>
            <TableCell className="sm:table-cell hidden">
                <div className="text-right w-full">
                    <Link href={link}>
                        <a className="button-primary text-xl py-1 inline-block">
                            Details
                        </a>
                    </Link>
                </div>
            </TableCell>
        </TableRow>
    );
}
