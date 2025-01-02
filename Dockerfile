# Use an official Tomcat image with OpenJDK 21
FROM tomcat:10.1-jdk21-openjdk-slim

# Remove the default web applications provided by Tomcat
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your WAR file into Tomcat's webapps directory
COPY FactoryFlow2.war /usr/local/tomcat/webapps/FactoryFlow2.war

# Expose port 8080, which is the default for Tomcat
EXPOSE 8080

# Start Tomcat server when the container is started
CMD ["catalina.sh", "run"]
