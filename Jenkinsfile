pipeline {
    agent any

	environment {
		M2_INSTALL = "/home/gamut/Distros/apache-maven-3.6.0/bin/mvn"
	}

    stages {
		stage('Build') {
	    	steps {
				sh '${M2_INSTALL} install -DskipTests'
			}
	    }
		stage('Unit Tests') {
			steps {
				sh '${M2_INSTALL} surefire:test'
			}
		}
		stage('Deployment') {
	    	steps {
				sh 'sshpass -p "gamut" scp target/gamutkart.war gamut@172.17.0.3:/home/gamut/Distros/apache-tomcat-8.5.38/webapps'
				sh 'sshpass -p "gamut" ssh gamut@172.17.0.3 "JAVA_HOME=/home/gamut/Distros/jdk1.8.0_151" "/home/gamut/Distros/apache-tomcat-8.5.38/bin/startup.sh"'
	    	}
		}

    }
}
