#!groovy

pipeline {
   agent none
   stages {     
    stage('Nginx Install') {
     agent any
     steps {
	sh "docker run -p 9889:80 -d --name nginx nginx:latest"
	}
     }
     stage('Docker Build') {
      agent any
      steps {
        sh 'docker build -t nginx/nginx:latest .'
      }
    }
    stage('Docker Push') {
      agent any
      steps {
        withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
          sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
          sh 'docker push nginx/nginx:latest'
        }
      }
    }
   }
 }

