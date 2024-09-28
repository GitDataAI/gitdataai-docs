FROM node:20-alpine3.17

RUN npm install pnpm -g


RUN apk add --no-cache \
    bash bash-completion supervisor \
    autoconf automake build-base libtool nasm


RUN mkdir /docusaurus
WORKDIR /docusaurus

ADD . /

RUN pnpm i

RUN pnpm run start
