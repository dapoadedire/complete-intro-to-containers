# build step
FROM node:20 AS node-builder
WORKDIR /app
COPY package.json package-lock.json ./
RUN npm ci
COPY . .
RUN npm run build

# serve step
FROM caddy:latest
COPY --from=node-builder /app/dist /usr/share/caddy/
COPY Caddyfile /etc/caddy/Caddyfile
