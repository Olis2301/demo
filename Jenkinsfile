pipeline {
    agent any

    environment {
        KUBECONFIG = credentials('kubeconfig-demo') // ambil dari Jenkins credentials
    }

    stages {
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t olisdecoy/demo:latest .'
            }
        }
        stage('Push Docker Image') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
                    sh 'echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin'
                    sh 'docker push olisdecoy/demo:latest'
                }
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                sh 'helm upgrade --install demo-app ./demo-app --set image.repository=olisdecoy/demo --set image.tag=latest'
            }
        }
    }
}
