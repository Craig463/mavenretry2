pipeline{
	agent{
		docker{
			image 'maven:3-alpine'
	}
}

	stages {
		stage('Compile'){
			steps {
				echo 'compiling'
				sh 'mvn clean compile'
				sh 'ls -l'
			}
		}
		stage('Test'){
			steps{
				echo 'testing'
				sh 'mvn package'
				sh 'ls -l'
				
			}
		}
		stage('Deploy'){
			steps{
				echo 'deploying'
				sh 'mvn install'
				sh 'ls -l'
				
			}
		}
	}
	post{
		success {
			archiveArtifacts(artifacts: '**/target/*.jar', allowEmptyArchive: true)
		}
		failure {
			echo 'Build Failed'
		}
	}
}
