FROM openjdk:8
WORKDIR /lib
COPY target/*.jar app.jar
EXPOSE 9090

