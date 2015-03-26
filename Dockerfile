FROM johna1203/nginx-php:latest
MAINTAINER Johnathan Froeming <johnathan@kodokux.com>
ENV VERSION 1.9.0.1

RUN apt-get install -y mysql-client

ADD config /config
ADD etc /etc
