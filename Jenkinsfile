pipeline {
    agent any

//	tools {
//		jdk 'jdk8'
//	}
//	environment {
//		M2_INSTALL = "/usr/bin/mvn"
//	}

    stages {
        stage('Clone-Repo') {
	    	steps {
	        	checkout scm
	    	}
        }

        stage('Build') {
            steps {
                sh 'mvn install -Dmaven.test.skip=true'
            }
        }
		
        stage('Unit Tests') {
            steps {
                sh 'mvn compiler:testCompile'
                sh 'mvn surefire:test'
                junit 'target/**/*.xml'
            }
        }

        stage('Deployment') {
            steps {
                sh 'sshpass -p "akash" scp target/gamutkart.war akash@172.17.0.2:/home/akshatha/Distros/apache-tomcat-9.0.91/webapps'
                sh 'sshpass -p "akash" ssh akash@172.17.0.2 "/home/akshatha/Distros/apache-tomcat-9.0.91/bin/startup.sh"'
            }
        }
    }
}
