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
                sh 'nohup java -jar target/chatroomapplication-0.0.1-SNAPSHOT.jar &'
            }
        }
    }
}
