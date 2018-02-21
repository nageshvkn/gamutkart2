#!/bin/bash
#
# ENVIRONMENT value comes from jenkins parameter selection
if [ $ENVIRONMENT = "QA" ]; then
#
# This deploys the war file into tomcat's webapps directory
  sshpass -p "gamut" scp $WORKSPACE/target/gamutkart.war gamut@172.17.0.2:/home/gamut/apache-tomcat-8.5.23/webapps
#
# This login's to tomcat machine, sets java_home environment variable, starts tomcat server
# and changes permission for tomcat folder to 777
  sshpass -p "gamut" ssh gamut@172.17.0.2 "JAVA_HOME=/home/gamut/jdk1.8.0_151" "/home/gamut/apache-tomcat-8.5.23/bin/startup.sh" "chmod 777 -R /home/gamut/apache-tomcat-8.5.23"

elif [ $ENVIRONMENT = "SIT" ]; then
  echo deploying the code into SIT environment...
  sshpass -p "gamut" scp $WORKSPACE/target/gamutkart.war gamut@172.17.0.3:/home/gamut/apache-tomcat-8.5.23/webapps
  #
  sshpass -p "gamut" ssh gamut@172.17.0.3 "JAVA_HOME=/home/gamut/jdk1.8.0_151" "/home/gamut/apache-tomcat-8.5.23/bin/startup.sh" "chmod 777 -R /home/gamut/apache-tomcat-8.5.23"
fi

