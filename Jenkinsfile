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
		stage('Build'){
				docker{
					image 'maven:3-alpine'
				}
		}
		steps{
			sh 'mvn clean install'
			sh 'java -jar my-app-1.0-SNAPSHOT.jar'
			sh 'copy my-app-1.0-SNAPSHOT.jar .'
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
		stage('Push'){
			steps{
			withCredentials([usernamePassword( credentialsId: 'docker-hub-credentials', usernameVariable: 'USER', passwordVariable: 'PASSWORD')]) {
			def registry_url = "https://registry.hub.docker.com"
			bat "docker login -u $USER -p $PASSWORD ${docker-hub-credentials}"
			docker.withRegistry("https://${docker-hub-credentials}", "docker-hub-credentials"){
			//push your image now
			//bat "docker push username/folder:build"
			bat "docker push in-jenkins-image:latest"
					}	
				}
			}

		}
	
	}
	post{
		success{
			archiveArtifacts(artifacts: '**/target/*.jar', allowEmptyArchive: true)
		}
		fail{
			echo 'failed'
		}

	}
}
