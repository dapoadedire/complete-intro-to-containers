FROM node:20

RUN useradd -ms /bin/bash lolcat

USER node
WORKDIR /home/node/code

COPY --chown=node . .
EXPOSE 8080

RUN npm ci

CMD ["node", "index.js"]
