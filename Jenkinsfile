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
       sh 'mvn clean install'
       }
     }
   }
 }
