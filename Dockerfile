FROM johna1203/docker-nginx-php:latest
MAINTAINER Johnathan Froeming <johnathan@kodokux.com>
ENV VERSION 1.9.0.1

RUN apt-get update
RUN apt-get install -y mysql-client libmysqlclient-dev python curl git build-essential libssl-dev libffi-dev python-dev

ADD config /config
ADD etc /etc

#install pip
RUN curl -kL https://raw.github.com/pypa/pip/master/contrib/get-pip.py | python

#install get_magento
RUN pip install git+https://johna1203@bitbucket.org/johna1203/get_magento.git
