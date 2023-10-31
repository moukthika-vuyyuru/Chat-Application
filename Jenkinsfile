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
                // Deploy the Spring Boot application
                script {
                    withEnv(['JENKINS_NODE_COOKIE=dontKill']){
                       sh 'nohup java -jar target/chatroomapplication-0.0.1-SNAPSHOT.jar > my-app.log 2>&1 &'
                    }
                }
            }
        }
    }
}
