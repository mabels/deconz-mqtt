#FROM maven:3-jdk-8-alpine
FROM alpine:latest


RUN apk update && \
    apk add python py-pip

RUN pip install paho-mqtt

COPY . /app

WORKDIR /app

CMD python client.py

