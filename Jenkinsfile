pipeline {

    agent any
    environment{
        DOCKERHUB_CREDENTIALS=credentials('dockerhublogin')
    }

    stages {
         stage('Initialize'){
                def dockerHome = tool 'myDocker'
                env.PATH = "${dockerHome}/bin:${env.PATH}"
    }
        stage('Checkout') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/martwebber/devops-pipeline.git']]])
            }
        }
    
        stage('Build') {
            steps {
                sh 'docker build -t martwebber/docker-repo:latest .'
            }
        }

        stage('Test') {
            steps {
                echo 'Testing...'
            }
        }

        stage('Push Image') {
            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
                sh 'docker push martwebber/docker-repo:latest'
                echo 'Image puhed to docker hub'
            }
        }
    
        stage('Deploy to GKE') {
            steps {
                echo 'Deploying to GKE...'
            }
        }
    }
} 
