FROM alpine:3.19

RUN apk add --no-cache nodejs npm
RUN addgroup -S node && adduser -S node -G node

USER node

WORKDIR /home/node/code

COPY --chown=node:node package.json package-lock.json ./

RUN npm ci

COPY --chown=node:node . .

EXPOSE 8080
CMD ["node", "index.js"]
