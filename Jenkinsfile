	pipeline {
		agent any

		stages {
		    stage('Checkout') {
		        steps {
					checkout scm
					
		        }
		    }
			stage('Build') {
		        steps {
					sh 'mvn install -DskipTest'
		        }
			}
			stage('Test') {
		        steps {
					sh 'mvn test'
		        }
			}
		}
	}
