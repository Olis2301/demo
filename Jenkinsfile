pipeline {
    agent any
    environment {
        DOCKERHUB_CREDENTIALS = credentials('dockerhub-creds')
    }
    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/Olis2301/demo.git', branch: 'main'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t olisdecoy/demo:latest .'
            }
        }
        stage('Docker Login') {
            steps {
                sh "echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin"
            }
        }
        stage('Push Docker Image') {
            steps {
                sh 'docker push olisdecoy/demo:latest'
            }
        }
    }
}
