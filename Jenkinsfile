pipeline {
    agent any

    tools{
        maven 'maven'
        git 'git'
        jdk 'jdk'
    }

    stages {
        stage('Build & Test') {
            steps {
                echo 'Building and Testing...'
                echo "The Jenkins job name is: ${env.JOB_NAME}"
                sh 'mvn clean install'
                sh 'mvn clean package'
            }
        }

        stage('Packing the App') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Deploy') {
        steps {
            script {
                echo 'Deploying...'

                // Use the Jenkins Credentials Binding Plugin
                withCredentials([usernamePassword(credentialsId: 'docker-cred', usernameVariable: 'DOCKER_HUB_USER', passwordVariable: 'DOCKER_HUB_PASS')]) {

                    // Log in to Docker Hub using the bound credentials
                    sh "docker login -u $DOCKER_HUB_USER -p $DOCKER_HUB_PASS"

                    // Pull the Docker image from Docker Hub
                    sh "docker pull moukthikavuyyuru/chat-app:latest"

                    // Run the Docker image
                    sh "docker run -d -p 8081:8080 moukthikavuyyuru/chat-app:latest"
                }
            }
        }
    }

    }
}
