# Stage 1: Build the application
FROM maven:latest AS first
WORKDIR /app
COPY pom.xml .
COPY . .
RUN mvn clean package
 
# Stage 2: Deploy to Tomcat
FROM tomcat:9.0
COPY --from=first /app/target/maven-web-application.war /usr/local/tomcat/webapps/ROOT.war
 
EXPOSE 8080
 
CMD ["catalina.sh", "run"]