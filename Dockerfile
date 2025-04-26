FROM node:20

RUN useradd -ms /bin/bash lolcat

USER node
WORKDIR /home/node/code

COPY --chown=node . .

RUN npm ci

CMD ["node", "index.js"]
