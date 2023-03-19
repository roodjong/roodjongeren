FROM arm64v8/node:19.8-alpine AS dependencies

ENV NODE_ENV=production

WORKDIR /usr/src/app

COPY package.json yarn.lock ./

RUN yarn --frozen-lockfile

FROM arm64v8/node:19.8-alpine

ENV NODE_ENV=production
ENV NEXT_TELEMETRY_DISABLED 1

WORKDIR /usr/src/app

COPY . .

COPY --from=dependencies /usr/src/app/node_modules ./node_modules

EXPOSE 3000

CMD ["yarn", "start-prod"]
