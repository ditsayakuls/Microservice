FROM nginx:alpine
COPY ./HTML /usr/share/nginx/html
LABEL org.opencontainers.image.source https://github.com/ditsayakuls/microservice