	pipeline {
		agent any

		stages {
		    stage('gamutkart_build') {
		        steps {
					checkout scm
					mvn install
		        }
		    }
		    stage('gamutkart_publish_test_reports') {
		        steps {
		            echo 'Testing..'
		        }
		    }
		}
	}
