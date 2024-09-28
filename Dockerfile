FROM node:20

WORKDIR /app/website

COPY website/package.json /app/website/

RUN npm install

COPY website /app/website

RUN npm build

FROM nginx:stable

COPY --from=0 /app/website/build /usr/share/nginx/html
