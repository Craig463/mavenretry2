pipeline{
	agent any

	stages {
		stage('Build'){
			steps {
				echo 'building'
				mvn clean install
			}
		}
		stage('Test'){
			steps{
				echo 'testing'
				mvn clean install
			}
		}
		stage('Deploy'){
			steps{
				echo 'deploying'
				mvn clean install
			}
		}
	}
}
