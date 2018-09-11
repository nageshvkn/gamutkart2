pipeline {
	environment {
        MAVEN_HOME = tool('maven3.5')
    }

	agent {
		label 'win-label-1'
	} 

	stages {
	    stage('Checkout') {
	        steps {
				checkout scm			        }
		    }
		stage('Build') {
	        steps {
				sh '${MAVEN_HOME}/bin/mvn install'
	        }
		}
	}
}
