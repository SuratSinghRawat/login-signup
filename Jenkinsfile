pipeline{
    agent any
    tools {nodejs "node"}
    environment {
        imageName = "rawatbluebell/react-login-app"
        registryCredential = "rawatbluebell"
        dockerImage = ''
    }
    stages{
        stage("Install Dependencies"){
           steps{
             bat 'npm ci'
           }
        }

        stage("Test"){
            steps{
                bat 'npm test'
            }
        }

        stage("building Image"){
            steps{
                script{
                   dockerImage = docker.build imageName
                }
            }
        }

        stage("Deploy Image"){
            steps{
                script{
                    docker.withRegistry("https://registry.hub.docker.com","dockerhub_creds"){
                        dockerImage.push("${env.BUILD_NUMBER}")
                    }
                }
            }
        }

    }
}
