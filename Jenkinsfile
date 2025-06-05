pipeline {
    agent any

	tools {
		jdk 'jdk11'
	}

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
                sh 'sshpass -p "1234" scp target/gamutkart.war wiculty@172.17.0.2:/home/wiculty/Distros/apache-tomcat-10.1.41/webapps'
                sh 'sshpass -p "1234" ssh wiculty@172.17.0.2 "/home/wiculty/Distros/apache-tomcat-10.1.41/bin/startup.sh"'
            }
        }
    }
}
