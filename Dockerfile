FROM ubuntu:20.04 
MAINTAINER "info@wiculty.com"
RUN apt-get update
RUN apt-get install -y openjdk-11-jdk
ENV JAVA_HOME /usr
ADD apache-tomcat-10.1.42 /root
COPY target/gamutkart.war /root/apache-tomcat-10.1.42/webapps
ENTRYPOINT /root/apache-tomcat-10.1.42/bin/startup.sh && bash

