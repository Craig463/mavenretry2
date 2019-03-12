FROM openjdk:8-jre-alpine

COPY my-app-1.0-SNAPSHOT.jar .
CMD java -jar my-app-1.0-SNAPSHOT.jar
