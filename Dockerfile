FROM node:16-alpine as builder

WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN node node_modules/react-scripts/scripts/build.js

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html