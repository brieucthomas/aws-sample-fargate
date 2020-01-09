FROM nginx:stable-alpine

COPY docker/nginx /etc/nginx

WORKDIR /usr/share/nginx/html
COPY src/ .
