FROM openjdk:17
WORKDIR /webapp
COPY webapp.jar .
EXPOSE 8080
CMD ["java","-jar" ,"webapp.jar"]