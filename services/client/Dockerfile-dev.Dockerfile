FROM node:8.0.0-alpine
RUN mkdir -p /srv/services/client
WORKDIR /srv/services/client
COPY package.json ./
RUN yarn && yarn cache clean
COPY . .
CMD ["npm", "run", "start"]

#docker build -f Dockerfile-dev.Dockerfile .