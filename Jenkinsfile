pipeline {
	agent {
		label win-label-1
	} 

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
