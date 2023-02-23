FROM amazoncorretto:11-alpine as build
WORKDIR /opt/springrest
COPY . .
RUN ./gradlew assemble

FROM amazoncorretto:11-alpine as runtime
WORKDIR /opt/amazoncorretto/app
COPY --from=build /opt/springrest/build/libs/rest-service-0.0.1-SNAPSHOT.jar .
CMD ["java", "-jar", "rest-service-0.0.1-SNAPSHOT.jar"]
EXPOSE 8080
LABEL org.opencontainers.image.source https://github.com/albertosantiago-lt/hello-springrest
