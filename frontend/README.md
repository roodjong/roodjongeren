This is a [Next.js](https://nextjs.org/) project bootstrapped with [`create-next-app`](https://github.com/vercel/next.js/tree/canary/packages/create-next-app).

## Getting Started

First, run the development server:

```bash
npm run dev
# or
yarn dev
```

Open [http://localhost:3000](http://localhost:3000) with your browser to see the result.

## Production Docker image

The production image uses [Next.js standalone output](https://nextjs.org/docs/app/api-reference/config/next-config-js/output). It contains only the traced runtime files, static assets, and public files; it does not install the full frontend dependency tree at runtime.

Several pages and the department redirects are generated from Strapi. Docker builds happen before the Compose services start, so pass a CMS URL that is reachable from the Docker builder (not the internal `strapi` hostname):

```bash
docker build --build-arg BACKEND_URL=https://roodjongeren.nl/backend -t roodjongeren-frontend .
```

The production Compose files set this through `NEXT_BUILD_BACKEND_URL` and default it to the public CMS endpoint. At runtime, `BACKEND_URL` can still point at the internal `strapi` service as configured in Compose.

You can start editing the page by modifying `pages/index.tsx`. The page auto-updates as you edit the file.

[API routes](https://nextjs.org/docs/api-routes/introduction) can be accessed on [http://localhost:3000/api/hello](http://localhost:3000/api/hello). This endpoint can be edited in `pages/api/hello.ts`.

The `pages/api` directory is mapped to `/api/*`. Files in this directory are treated as [API routes](https://nextjs.org/docs/api-routes/introduction) instead of React pages.

## Learn More

To learn more about Next.js, take a look at the following resources:

- [Next.js Documentation](https://nextjs.org/docs) - learn about Next.js features and API.
- [Learn Next.js](https://nextjs.org/learn) - an interactive Next.js tutorial.

You can check out [the Next.js GitHub repository](https://github.com/vercel/next.js/) - your feedback and contributions are welcome!

## Deploy on Vercel

The easiest way to deploy your Next.js app is to use the [Vercel Platform](https://vercel.com/new?utm_medium=default-template&filter=next.js&utm_source=create-next-app&utm_campaign=create-next-app-readme) from the creators of Next.js.

Check out our [Next.js deployment documentation](https://nextjs.org/docs/deployment) for more details.
