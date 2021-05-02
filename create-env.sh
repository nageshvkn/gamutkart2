#!/bin/bash
cont_count=$1
echo "creating $cont_count containers.."
sleep 2;
for i in `seq $cont_count`
do
	echo "=============================="
    echo "Creating tomcat-server$i container.."
    sleep 1
    docker run -it -d --name tomcat-server$i nageshvkn/gamutkart-img
    echo "tomcat-server$i container has been created!"
	echo "=============================="
done
docker inspect --format {{.NetworkSettings.Networks.bridge.IPAddress}} `docker ps -q` > IPs.txt
