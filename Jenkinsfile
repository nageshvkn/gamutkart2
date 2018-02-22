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
					sh 'mvn install -DskipTests'
		        }
			}
			stage('Test') {
		        steps {
					sh 'mvn test'
		        }
			}
		}
	}
