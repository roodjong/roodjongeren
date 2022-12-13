export function dateToText(date: Date): string {
    return date.toLocaleDateString("nl", {
        day: "numeric",
        month: "long",
        year: "numeric",
    });
}
