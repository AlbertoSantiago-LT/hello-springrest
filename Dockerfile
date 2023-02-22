FROM amazoncorretto:11-alpine
WORKDIR /opt/springrest
COPY ./app .
RUN ["ls"]
EXPOSE 80
LABEL org.opencontainers.image.source https://github.com/albertosantiago-lt/hello-springrest
