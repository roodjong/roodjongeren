FROM arm64v8/node:24-alpine

WORKDIR /usr/src/app

ENV NODE_ENV=production

COPY package.json .
COPY yarn.lock .

RUN yarn install --frozen-lockfile

COPY . .

EXPOSE 1337

CMD ["yarn", "start-prod"]
