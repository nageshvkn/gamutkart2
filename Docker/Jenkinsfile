pipeline {
	agent any

	tools {
		maven 'maven3.6'
	}

	stages {
		stage('Clone-Repo') {
			steps {
				checkout scm
			}
		}
		stage('Build') {
			steps {
				sh "mvn install"
			}
		}
		stage('Create-Image') {
			steps {
				sh 'docker build -t="nageshvkn/gamutkart-img" .'
			}
		}
		stage('Create-ENV') {
			steps {
				sh "./create-env.sh 8"
			}
		}
	}
}
