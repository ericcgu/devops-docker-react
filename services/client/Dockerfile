FROM node:8.0.0-alpine as builder
WORKDIR '/srv/services/client'
COPY package*.json ./
RUN yarn && yarn cache clean
COPY . .
RUN ["yarn", "build"]

FROM nginx:stable-alpine
EXPOSE 80 
COPY --from=builder '/srv/services/client/build' '/usr/share/nginx/html'

#docker build .
#docker run -p 8080:80 [container_id]