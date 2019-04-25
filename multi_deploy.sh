#!/bin/bash

for i in `cat multi-deploy-IPs.txt`
	do
#
	echo "Deploying war file into $i QA server.."
	sleep 3
	sshpass -p "gamut" scp target/gamutkart.war gamut@$i:/home/gamut/Distros/apache-tomcat-8.5.38/webapps
#
	echo "Starting tomcat server in $i QA server.."
	sshpass -p "gamut" ssh gamut@$i "JAVA_HOME=/home/gamut/Distros/jdk1.8.0_151" "/home/gamut/Distros/apache-tomcat-8.5.38/bin/startup.sh"
#
	done
	echo "Deployment is succussful!"
