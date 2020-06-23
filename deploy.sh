#!/bin/bash
##
##
ENVIRONMENT=$1
if [ $ENVIRONMENT = "QA" ];then

    sshpass -p "gamut" scp target/gamutgurus.war gamut@172.17.0.3:/home/gamut/Distros/apache-tomcat-8.5.50/webapps

    sshpass -p "gamut" ssh gamut@172.17.0.3 "JAVA_HOME=/home/gamut/Distros/jdk1.8.0_241" "/home/gamut/Distros/apache-tomcat-8.5.50/bin/startup.sh"

elif [ $ENVIRONMENT = "SIT" ];then
    sshpass -p "gamut" scp target/gamutgurus.war gamut@172.17.0.4:/home/gamut/Distros/apache-tomcat-8.5.50/webapps

    sshpass -p "gamut" ssh gamut@172.17.0.4 "JAVA_HOME=/home/gamut/Distros/jdk1.8.0_241" "home/gamut/Distros/apache-tomcat-8.5.50/bin/startup.sh"

fi

