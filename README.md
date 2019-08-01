# README

## what is this about
this is a docker file for jenkins to use docker-compose build

To better use in China I changed the sources list to aliyun mirror
and download the docker-compose 1.24.1 linux x86_64 in this repo.
You should change it to fit your own localization instead.


## how to use
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



## additional

If you want to use shell to sh remote server,you can put the ssh key pair in this folder.
Then uncomment this code in Dockerfile:

```
#RUN yum -y install openssh-clients
#COPY ./id_rsa /root/.ssh/id_rsa
#RUN chmod 600 /root/.ssh/id_rsa
#COPY ./ssh_config /root/.ssh/config
#RUN chmod 600 /root/.ssh/config
```

## out of the topic

You can also try to install the docker-compose in the alpine container of jenkins to use 'agent any' in the Jenkinsfile