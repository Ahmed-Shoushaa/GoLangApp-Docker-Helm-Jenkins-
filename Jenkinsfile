pipeline {
    agent any

    stages{
        stage('Clone repository') { 
            steps { 
                script{
                    checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/Ahmed-Shoushaa/golang.git']])
                }
            }
        }
        
        stage('Build image'){
            steps{
                script{
                    sh 'docker build -t goapp:latest ./code-with*'
                }
            }
        }
        
       stage('Push image'){
            steps{
                script{
                sh '''
                    docker login -u DOCKER-HUB-USER-NAME -p DOCKER-HUB-PASSWORD
                    docker tag goapp shoushaa/goapp:latest
                    docker push shoushaa/goapp:latest
                '''                }
            }
        }
    }
}
