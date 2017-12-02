#!/bin/bash
#one
TOMCAT_HOST=192.168.1.6
TOMCAT_USER=gamut-idc-node1
TOMCAT_PWD=gamut
TOMCAT_HOME=/home/gamut-idc-node1/Distros/apache-tomcat-8.5.11
#
WAR_FILE_PATH=target/gamutkart.war

echo "Bringing tomcat server down for deployment..."
sleep 3

$TOMCAT_HOME/bin/shutdown.sh 1>/dev/null 2>&1

#1>file.log 2>&1
if [ -f $WAR_FILE_PATH ];then
    echo "deploying gamutkart application..."
    sleep 4
    sshpass -p "Gamut" ssh $TOMCAT_USER@$TOMCAT_HOST
    scp  $WAR_FILE_PATH $TOMCAT_USER@$TOMCAT_HOST:$TOMCAT_HOME/webapps
else
   echo "war file doesn't exist! Please check the build"
fi

echo "starting tomcat server..."
$TOMCAT_HOME/bin/startup.sh 1>/dev/null 2>&1

echo "deployment is successful! Email notification has been sent!"
