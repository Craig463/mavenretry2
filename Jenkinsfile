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
		stage('Push'){
			withCredentials([usernamePassword( credentialsId: 'docker-hub-credentials', usernameVariable: 'USER', passwordVariable: 'PASSWORD')]) {
			def registry_url = ""https://cloud.docker.com/repository/registry-1.docker.io/craig463/jenkinstodocker
			bat "docker login -u $USER -p $PASSWORD ${https://cloud.docker.com/repository/registry-1.docker.io/craig463/jenkinstodocker}"
			docker.withRegistry("http://${https://cloud.docker.com/repository/registry-1.docker.io/craig463/jenkinstodocker}", "docker-hub-credentials"){
			//push your image now
			//bat "docker push username/folder:build"
			bat "docker push in-jenkins-image:latest"
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
