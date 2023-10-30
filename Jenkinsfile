pipeline {
    agent any

    environment {
        DOCKER_CREDENTIAL_ID = 'docker-cred'
        DOCKER_IMAGE = 'moukthikavuyyuru/chat-app:latest'
    }

    stages {
        stage('Build & Test') {
            steps {
                echo 'Building and Testing...'
                sh 'mvn clean install'
            }
        }

        stage('Build & Push Docker Image') {
            steps {
                echo 'Building Docker Image...'
                sh "docker build -t ${DOCKER_IMAGE} ."
                
                echo 'Pushing Docker Image to DockerHub...'
                withDockerRegistry([credentialsId: "${DOCKER_CREDENTIAL_ID}", url: ""]) {
                    sh "docker push ${DOCKER_IMAGE}"
                }
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying...'
                // This is a basic Docker run. Depending on your deployment target, this might be different.
                sh "docker run -d -p 8080:8080 ${DOCKER_IMAGE}"
            }
        }
    }
}
