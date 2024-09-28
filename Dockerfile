FROM node:20-alpine3.17


RUN mkdir /docusaurus
WORKDIR /docusaurus

ADD . /

RUN npm install

CMD ["npm run start"]