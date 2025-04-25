FROM node:20

RUN useradd -ms /bin/bash lolcat

USER lolcat

COPY index.js /home/lolcat/code/index.js


CMD ["node", "/home/lolcat/code/index.js"]
