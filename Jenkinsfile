pipeline{
	agent{
		docker{
			image 'maven:3-alpine'
	}
}

	stages {
		stage('Build'){
			steps {
				echo 'building'
				sh 'mvn install -DskipTests'
			}
		}
		stage('Test'){
			steps{
				echo 'testing'
				
			}
		}
		stage('Deploy'){
			steps{
				echo 'deploying'
				
			}
		}
	}
}
