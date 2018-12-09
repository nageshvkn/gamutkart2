pipeline {
	agent any

	stages {
	    stage('Checkout') {
	        steps {
				checkout scm			        }
		    }
		stage('Build') {
	        steps {
				sh '/home/gamut/Distros/apache-maven-3.6.0/bin/mvn install'
	        }
		}
	}
}
