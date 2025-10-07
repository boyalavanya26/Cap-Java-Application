FROM openjdk:17
WORKDIR /webapp
COPY . .
EXPOSE 8080
CMD ["java","-jar" ,"webapp.jar"]