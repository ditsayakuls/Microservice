pipeline{
    agent any 
    environment{
        APP_NAME= "test app name"
    }
    stages {
        stage('Build Image'){
            steps{
                sh "echo ${env.APP_NAME}"
            }   
        }
        stage('Build Stage (Docker)'){
            agent { label 'build-server'}
            steps {
                sh "docker build ghcr.io/ditsayakuls/microservice2 ."
            }
        }
    }
}
