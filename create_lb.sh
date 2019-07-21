#!/bin/bash
echo -e "Setting up load balancer for below IPs\n$(cat IPs.txt)"
for i in `cat IPs.txt`
do
	echo "Adding $i to Load Balancer.."
done
	echo "LB set up done! Use 'www.flipkart-qa.com' to access the environment"

