#!/bin/bash
#
echo Selected Environemnt $ENVIRONMENT...
echo Deploying the code into $ENVIRONMENT...

if [ $ENVIRONMENT="QA" ];then
  sshpass -p "gamut" scp /home/praveen/.jenkins/workspace/test_gamutkart/target/gamutkart.war \
  gamut@172.17.0.2:/home/gamut/Distros/apache-tomcat-8.5.11/webapps
  echo "Deployment is succussful!"
  echo "Starting tomcat server.."
  sshpass -p "gamut" ssh gamut@172.17.0.2 "JAVA_HOME=/home/gamut/Distros/jdk1.8.0_121" "/home/gamut/Distros/apache-tomcat-8.5.11/bin/startup.sh"

elif [ $ENVIRONMENT="SIT" ];then
  sshpass -p "gamut" scp /home/praveen/.jenkins/workspace/test_gamutkart/target/gamutkart.war \
  gamut@172.17.0.3:/home/gamut/Distros/apache-tomcat-8.5.11/webapps
  echo "Deployment is succussful!"
  echo "Starting tomcat server.."
  sshpass -p "gamut" ssh gamut@172.17.0.3 "JAVA_HOME=/home/gamut/Distros/jdk1.8.0_121" "/home/gamut/Distros/apache-tomcat-8.5.11/bin/startup.sh"
fi
