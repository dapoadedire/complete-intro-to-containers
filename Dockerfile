FROM node:20-alpine


COPY --chown=node:node . /app
WORKDIR /app
CMD ["node", "index.js"]