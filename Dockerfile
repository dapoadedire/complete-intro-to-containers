# build step

FROM node:20 AS node-builder
RUN mkdir /build
WORKDIR /build
COPY package*.json ./
RUN npm ci
COPY  . .


# production step
FROM debian:bullseye-slim
RUN apt-get update && apt-get install -y curl && \
    curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs

RUN addgroup --system node && adduser --system --ingroup node node
USER node
RUN mkdir -p /home/node/code
WORKDIR /home/node/code
COPY --from=node-builder --chown=node:node /build .
EXPOSE 8080
CMD ["node", "index.js"]
