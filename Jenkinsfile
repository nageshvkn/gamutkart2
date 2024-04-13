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
                scp target/gamutkart.war gamut@172.31.26.38:/home/gamut/Distros/apache-tomcat-9.0.87/webapps'
                ssh gamut@ "/home/gamut@172.31.26.38/Distros/apache-tomcat-9.0.87/bin/startup.sh"'
            }
        }
    }
}
