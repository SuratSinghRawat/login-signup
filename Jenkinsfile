pipeline{
    agent any
    tools {nodejs "node"}
    //docker push 13.232.114.199:8082/react-login-app:8.0
    environment {
        //imageName = "rawatbluebell/react-login-app"
        imageName = "52.66.252.111:8082/react-login-app"
        // registryCredential = "rawatbluebell" // credentail for docker hub
        //registryCredential="Nexus-Cred" // credentail for Nexus registry
        dockerImage = ''
        //registry="ec2-43-204-142-119.ap-south-1.compute.amazonaws.com:8082/" 

        NEXUS_CREDS = credentials('Nexus-Cred')
        NEXUS_DOCKER_REPO = '52.66.252.111:8082'
    }
    stages{
        stage("Install Dependencies"){
           steps{
             bat 'npm install'
           }
        }

        stage("building Image"){
            steps{
                script{
                   dockerImage = docker.build imageName + ":8.1"
                }
            }
        }

        stage("Deploy Image"){
            steps{
                script{
                    //docker.withRegistry("https://registry.hub.docker.com","dockerhub_creds"){
                    //docker.withRegistry('http://'+registry,registryCredential){
                        // dockerImage.push("${env.BUILD_NUMBER}")
                    withCredentials([usernamePassword(credentialsId: 'Nexus-Cred')]){
                       sh ' echo $PASS | docker login -u $USER --password-stdin $NEXUS_DOCKER_REPO'
                      
                         dockerImage.push('latest')
                    }
                }
            }
        }

    }
}
