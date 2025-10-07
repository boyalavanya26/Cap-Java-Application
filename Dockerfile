FROM openjdk:17
WORKDIR /webapp
COPY target/maven-web-application.jar webapp.jar
EXPOSE 8080
CMD ["java","-jar" ,"webapp.jar"]