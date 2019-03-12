pipeline{
	agent none



	stages {
		stage('Compile'){
			agent {
				docker{
					image 'maven:3-alpine'
				}
			}
			steps {
				echo 'compiling'
				sh 'mvn clean compile'
				sh 'ls -l'
			}
		}
		stage('Test'){
			agent{
				docker{
					image 'maven:3-alpine'
				}
			}
			steps{
				echo 'testing'
				sh 'mvn package'
				sh 'ls -l'
				
			}
		}
		stage('Docker'){
			agent{
				docker{
					image 'docker:latest'
				}
			}
			steps{
				echo 'docking the docker into your jenkins'
				sh 'docker build -t in-jenkins-image .'
				sh 'ls -l'
				
			}
		}
	}
	
}
