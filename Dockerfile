FROM node:20-alpine

USER node


WORKDIR /home/node/code

COPY --chown=node:node package-lock.json package.json ./

RUN npm ci

COPY --chown=node:node . .

EXPOSE 8080
CMD ["node", "index.js"]