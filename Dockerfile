FROM node:20-alpine3.17

RUN npm install pnpm -g


RUN apk add --no-cache \
    bash bash-completion supervisor \
    autoconf automake build-base libtool nasm

ENV TARGET_UID=1000
ENV TARGET_GID=1000
ENV VERSION=latest
ENV WEBSITE_NAME='my-website'
ENV TEMPLATE='classic'

RUN mkdir /docusaurus
WORKDIR /docusaurus

ADD script/init.sh /
ADD script/run.sh /
COPY script/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN chmod a+x /init.sh  /run.sh

VOLUME [ "/docusaurus" ]
ENTRYPOINT [ "/init.sh" ]