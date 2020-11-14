FROM openjdk:8
WORKDIR /app
COPY target/*.jar app.jar
EXPOSE 9090

