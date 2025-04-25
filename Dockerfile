FROM node:20

RUN useradd -ms /bin/bash lolcat

USER node
WORKDIR /home/node/code

COPY --chown=node index.js .


CMD ["node", "index.js"]
