FROM openjdk:8-jdk-alpine

WORKDIR /app

COPY Main.java /app/

RUN javac Main.java

CMD ["java", "Main"]
