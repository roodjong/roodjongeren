FROM arm64v8/node:22-alpine AS dependencies

WORKDIR /usr/src/app

COPY package.json yarn.lock ./

RUN yarn --frozen-lockfile

FROM dependencies AS builder

WORKDIR /usr/src/app

# Several pages and the department redirects are generated from Strapi. Docker
# builds run before the Compose services start, so use a CMS URL reachable from
# the Docker builder rather than the internal `strapi` hostname.
ARG BACKEND_URL
ENV BACKEND_URL=$BACKEND_URL
ENV NEXT_TELEMETRY_DISABLED=1

COPY . .

RUN test -n "$BACKEND_URL" && yarn build

FROM arm64v8/node:22-alpine AS runner

WORKDIR /usr/src/app

ENV NODE_ENV=production
ENV NEXT_TELEMETRY_DISABLED=1
ENV PORT=3000
ENV HOSTNAME=0.0.0.0

RUN addgroup --system --gid 1001 nodejs \
    && adduser --system --uid 1001 nextjs

COPY --from=builder --chown=nextjs:nodejs /usr/src/app/public ./public
COPY --from=builder --chown=nextjs:nodejs /usr/src/app/.next/standalone ./
COPY --from=builder --chown=nextjs:nodejs /usr/src/app/.next/static ./.next/static

USER nextjs

EXPOSE 3000

CMD ["node", "server.js"]
