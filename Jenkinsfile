pipeline{
    agent any 
    enviroment{
        APP_NAME= "test app name"
    }
stages {
    stage('Build Image'){
     steps{
        sh"echo${env.APP_NAME}"
     }   
    }
    }
}
