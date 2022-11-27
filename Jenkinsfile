pipeline {
    agent {label 'docker'}
    environment {
    DOCKERHUB_CREDENTIALS = credentials('dockerhub')
    }
    stages { 
        
        stage('Build docker image') {
            steps {  
                sh 'docker build -t anilgudivada/dash:$BUILD_NUMBER .'
            }
        }
        stage('login to dockerhub') {
            steps{
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
            }
        }
        stage('push image') {
            steps{
                sh 'docker push anilgudivada/dash:$BUILD_NUMBER'
            }
        }
}
post {
        always {
            sh 'docker logout'
        }
    }
}
