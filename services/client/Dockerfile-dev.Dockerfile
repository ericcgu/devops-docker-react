FROM node:8.0.0-alpine
RUN mkdir /srv/client
WORKDIR /srv/client
COPY package.json .
RUN npm install
COPY . .
CMD [ "npm", "run", "start" ]