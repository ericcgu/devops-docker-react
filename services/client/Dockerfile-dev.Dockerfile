FROM node:8.0.0-alpine
RUN mkdir /srv/client
WORKDIR /srv/client
COPY package.json .
RUN npm install --no-progress --logLevel warn
COPY . .
CMD [ "npm", "run", "start" ]

#docker build -f Dockerfile-dev.Dockerfile .