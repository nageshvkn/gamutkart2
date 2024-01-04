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
                sh 'sshpass -p "123456" scp target/gamutgurus.war wiculty@127.0.1.1:/home/wiculty/insatllers/apache-tomcat-9.0.80/webapps'
                sh 'sshpass -p "123456" ssh wiculty@127.0.1.1 "/home/kavya/installers/apache-tomcat-9.0.80/bin/startup.sh"'
            }
        }
    }
}
