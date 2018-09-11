pipeline {
	agent slave1 

	stages {
	    stage('Checkout') {
	        steps {
				checkout scm			        }
		    }
		stage('Build') {
	        steps {
				sh 'mvn install'
	        }
		}
	}
}
