pipeline {
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
				sh 'M2_HOME=/home/gamut/Distros/apache-maven-3.5.4'
				sh 'mvn install'
	        }
		}
	}
}
