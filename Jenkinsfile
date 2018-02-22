	pipeline {
		agent any

		stages {
		    stage('gamutkart_build') {
		        steps {
					checkout scm
					sh 'mvn install'
		        }
		    }
		}
	}
