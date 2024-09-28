FROM nginx:1.25.3

COPY build/. /usr/share/nginx/html
COPY ./script/start.sh /docker-entrypoint.d/start.sh
COPY ./script/nginx.conf /etc/nginx/nginx.conf

RUN chmod +x /docker-entrypoint.d/start.sh
