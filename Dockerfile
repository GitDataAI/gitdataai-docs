FROM node:20-alpine3.17 as builder

RUN mkdir /docusaurus
WORKDIR /docusaurus

COPY . .

RUN npm install && npm run build

FROM nginx:latest

EXPOSE 80

COPY --from=builder /docusaurus/build /usr/share/nginx/html

CMD ["nginx", "-g", "daemon off;"]