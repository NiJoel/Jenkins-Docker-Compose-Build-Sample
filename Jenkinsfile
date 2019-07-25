pipeline {
    agent {
		docker {
				image '{repourl}:{port}/centdocker'
				args '-v /root/.nuget:/root/.nuget -v /var/run/docker.sock:/var/run/docker.sock'
			}
	}
    stages {
        stage('Build') {
            steps {
				sh '''
				cd src
				docker-compose build
				'''
            }
        }
    }
}