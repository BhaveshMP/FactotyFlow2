# Use an official Maven image with OpenJDK 17
FROM maven:3.8.4-jdk-17-slim AS build

# Set the working directory
WORKDIR /app

# Copy your pom.xml and the source code into the container
COPY pom.xml .
COPY src /app/src

# Run Maven to build the app
RUN mvn clean install

# Use a smaller JDK runtime image to run the app
FROM openjdk:17-jre-slim

# Copy the .war file from the build stage
COPY --from=build /app/target/FactoryFlow2.war /usr/local/tomcat/webapps/ROOT.war

# Expose port 8080
EXPOSE 8080

# Start Tomcat server when the container is started
CMD ["catalina.sh", "run"]
