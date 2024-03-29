pipeline{
    agent any 
    environment{
        APP_NAME= "test app name"
        IMAGE_NAME="ghcr.io/ditsayakuls/microservice2"
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
                sh " docker build -t ${env.IMAGE_NAME} ."
                // sh "docker build -t ghcr.io/ditsayakuls/microservice2 ."
            }
        }
        
        stage('Deliver Docker Image') {
            agent {label 'build-server'}
            steps {
                withCredentials(
                [usernamePassword(
                    credentialsId: 'ditsayakul',
                    passwordVariable: 'githubPassword',
                    usernameVariable: 'githubUsername'
                )]
                 ){
                sh "docker login ghcr.io -u ${env.githubUsername} -p ${env.githubPassword}"
                sh "docker tag ${env.IMAGE_NAME} ${env.IMAGE_NAME}:${env.BUILD_NUMBER}" 
                sh "docker push ${env.IMAGE_NAME}"
                sh "docker push ${env.IMAGE_NAME}:${env.BUILD_NUMBER}" 
                sh "docker rmi ${env.IMAGE_NAME}"
                sh "docker rmi ${env.IMAGE_NAME}:${env.BUILD_NUMBER}" 
                //sh "docker push ghcr.io/ditsayakuls/microservice2"
                
                }
                }
        }
            stage('Deploy Stage (K8s)') {
                agent {label 'deploy-server'}
                 steps {
                    script {
                        try {
                            sh "kubectl delete -f deploy-web.yml" 
                            } catch (e){
                                sh "echo can not delete"
                                        }
                                sh "kubectl apply -f deploy-web.yml"   
                        }
                }
            }
        }
    }

