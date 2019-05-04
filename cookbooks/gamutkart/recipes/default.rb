#
# Cookbook:: gamutkart
# Recipe:: default
#
# Copyright:: 2019, The Authors, All Rights Reserved.

apt_update "run apt-get update command" do
	frequency 86_400
	action :periodic
end

package "openjdk-8-jdk" do
	action :install
end


ENV['JAVA_HOME'] = '/usr'

cookbook_file "/home/gamut/apache-tomcat-8.5.38.tar.gz" do
	source "apache-tomcat-8.5.38.tar.gz"
end

execute "extract tomcat package" do
	command "cd /home/gamut; tar -zxvf apache-tomcat-8.5.38.tar.gz"
end

execute "start tomcat server" do
	command "/home/gamut/apache-tomcat-8.5.38/bin/startup.sh"
end

cookbook_file "/home/gamut/apache-tomcat-8.5.38/webapps/gamutkart.war" do
	source "gamutkart.war"
end




