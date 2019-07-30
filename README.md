# README

this is a docker file for jenkins to use docker-compose build

To better use in China I changed the sources list to aliyun mirror
and download the docker-compose 1.24.1 linux x86_64 in this repo.

You should change it to fit your own localization.

You should use it to build image and push to your own repo

```
docker build -t {repourl}:{port}/centdocker .
docker push {repourl}:{port}/centdocker
```

then use it in  Jenkinsfile
```
pipeline {
    agent {
		docker {
				image '{repourl}:{port}/centdocker'
				args '-v /var/run/docker.sock:/var/run/docker.sock'
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
```