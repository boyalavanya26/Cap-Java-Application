FROM openjdk:17
WORKDIR /webapp
COPY package.jar .
EXPOSE 8080
CMD ["java","-jar" ,"webapp.jar"]