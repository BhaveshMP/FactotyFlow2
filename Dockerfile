# Use a Maven image with OpenJDK 17 to build the app
FROM maven:3.8.4-jdk-17-slim AS build

# Set the working directory
WORKDIR /app

# Copy your pom.xml and source code
COPY pom.xml . 
COPY src /app/src

# Run Maven to build the app
RUN mvn clean install -DskipTests

# Use OpenJDK 17 runtime image for running the app
FROM openjdk:17-jre-slim

# Remove the default web apps provided by Tomcat
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the WAR file from the build stage to Tomcat webapps directory
COPY --from=build /app/target/FactoryFlow2.war /usr/local/tomcat/webapps/ROOT.war

# Expose port 8080 for Tomcat
EXPOSE 8080

# Start Tomcat server when the container is started
CMD ["catalina.sh", "run"]
