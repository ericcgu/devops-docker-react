FROM node:8.0.0-alpine as build
WORKDIR '/srv/services/client'
COPY package.json .
RUN yarn && yarn cache clean
COPY . .
CMD ["npm", "run", "build"]

FROM nginx 
COPY --from=build /app/build /usr/share/nginx/html

#docker build -f .