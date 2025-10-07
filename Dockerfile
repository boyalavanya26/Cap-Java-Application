# -------- Stage 1: Build the WAR using Maven --------
FROM maven:3.8.5-openjdk-17 AS builder

WORKDIR /app

# Copy all project files
COPY . .

# Build the WAR file
RUN mvn clean package

# -------- Stage 2: Deploy to Tomcat --------
FROM tomcat:9.0

# Remove default webapps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy WAR file from builder stage
COPY --from=builder /app/target/maven-web-application.war /usr/local/tomcat/webapps/ROOT.war

# Expose port
EXPOSE 8080

# Start Tomcat in foreground
ENTRYPOINT ["catalina.sh", "run"]