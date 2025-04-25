FROM node:20

RUN useradd -ms /bin/bash lolcat

USER node

COPY --chown=node index.js /home/node/code/index.js


CMD ["node", "/home/node/code/index.js"]
