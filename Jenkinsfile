	pipeline {
		agent any

		stages {
		    stage('gamutkart_build') {
		        steps {
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
