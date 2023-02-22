FROM amazoncorretto:11-alpine
WORKDIR /opt/springrest
COPY . .
RUN ["java","-jar","app/gradle/wrapper/gradle-wrapper.jar"]
EXPOSE 80
