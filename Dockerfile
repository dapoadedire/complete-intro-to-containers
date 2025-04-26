FROM node:20

RUN useradd -ms /bin/bash lolcat

USER node
WORKDIR /home/node/code

COPY --chown=node:node package*.json ./
RUN npm ci


COPY --chown=node . .

EXPOSE 8080



CMD ["node", "index.js"]
