FROM openjdk:17-jdk
LABEL org.opencontainers.image.description "An example of building a CI & CD pipeline using GitHub Actions."
ARG JAR_FILE=./target/CI-CD-0.0.1-SNAPSHOT.jar
ADD ${JAR_FILE} app.jar
CMD ["java", "-jar", "app.jar"]
