# Use an official OpenJDK base image
FROM openjdk:11-jre-slim

# Set the application's working directory in the container
WORKDIR /app

# Copy the build artifact (JAR) from the build context to the working directory
COPY target/chatroomapplication-0.0.1-SNAPSHOT.jar app.jar

# Instruct the container to run the application when it starts
CMD ["java", "-jar", "app.jar"]
