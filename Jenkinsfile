pipeline {
    agent any

	tools {
		maven 'maven3.6'
	}
//
//	environment {
//		M2_INSTALL = "/home/gamut/Distros/apache-maven-3.6.0/bin/mvn"
//	}

    stages {
		stage('Clone-Repo') {
			steps {
				checkout scm
			}
		}
		stage('Build') {
	    	steps {
				sh 'mvn install -DskipTests'
			}
	    }
		stage('Unit Tests') {
			steps {
				sh 'mvn surefire:test'
			}
		}
		stage('Deployment') {
	    	steps {
				if($ENVIRONMENT == SIT)
				{
					println("deploying the code into SIT Environment");
				} else if($ENVIRONMENT = QA)
				  {
						println("deploying the code into QA Environment");
				  }
					
//				print "Deployment is done!"
//				sh 'sshpass -p "gamut" scp target/gamutkart.war gamut@172.17.0.3:/home/gamut/Distros/apache-tomcat-8.5.41/webapps'
//				sh 'sshpass -p "gamut" ssh gamut@172.17.0.3 "JAVA_HOME=/home/gamut/Distros/jdk1.8.0_211" "/home/gamut/Distros/apache-tomcat-8.5.41/bin/startup.sh"'
	    	}
		}
    }
}
