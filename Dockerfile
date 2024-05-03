FROM maven:3.9.6-amazoncorretto-8 as build
WOKDIR /app
COPY . .
RUN mvn clean package

FROM tomcat:8.0.21-jre8
COPY --from=build /app/target/maven-web-application.war /usr/local/tomcat/webapps/maven-web-application.war
