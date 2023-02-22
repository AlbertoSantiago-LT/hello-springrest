FROM amazoncorretto:11-alpine
WORKDIR /opt/springrest
COPY ./app .
#RUN ["./gradlew build"]
EXPOSE 80
LABEL org.opencontainers.image.source https://github.com/albertosantiago-lt/hello-springrest
