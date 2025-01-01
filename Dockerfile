# Use Tomcat 10.1 with OpenJDK 17
FROM tomcat:10.1-jdk17-slim

# Set the working directory
WORKDIR /usr/local/tomcat

# Remove the default web applications provided by Tomcat
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your WAR file into Tomcat's webapps directory
COPY FactoryFlow2.war /usr/local/tomcat/webapps/ROOT.war

# Expose port 8080, which is the default for Tomcat
EXPOSE 8080

# Start Tomcat server when the container is started
CMD ["catalina.sh", "run"]
