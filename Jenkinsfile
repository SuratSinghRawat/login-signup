pipeline{
    agent any
    tools {nodejs "node"}
  
    environment {
        imageName = "react-login-app"
        registryCredentials = "Nexus-Cred" 
        registry="ec2-43-204-236-51.ap-south-1.compute.amazonaws.com:8082/"
        dockerImage = ''
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
                   dockerImage = docker.build imageName
                }
            }
        }

        stage("Deploy Image"){
            steps{
                script{
                    docker.withRegistry('http://'+registry, registryCredentials){
                    dockerImage.push("${env.BUILD_NUMBER}")
                    
                    }
                }
            }
        }

    }
}
