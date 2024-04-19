#!groovy

pipeline {
  agent none
  stages {
    stage('Nginx Install') {
      agent {
        docker {
          image 'nginx:latest'
        }
      }
      steps {
        sh 'echo hello_word'
      }
    }
    stage('Docker Build') {
      agent any
      steps {
        sh 'docker build -t nginx:latest .'
      }
    }
    stage('Docker Push') {
      agent any
      steps {
        withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
          sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
        }
      }
    }
    stage('send telegram') {
        withCredentials([string(credentialsId: 'botSecret', variable: 'TOKEN'), string(credentialsId: 'chatId', variable: 'CHAT_ID')]) {
        sh  ("""
            curl -s -X POST https://api.telegram.org/bot${TOKEN}/sendMessage -d chat_id=${CHAT_ID} -d parse_mode=markdown -d text='*${env.JOB_NAME}* : POC *Branch*: ${env.GIT_BRANCH} *Build* : OK *Published* = YES'
        """)
        }
     }
    stage('RUN script') {
      agent any
      steps {
          sh 'bash -vx script.sh'
      }
    }
  }
}
