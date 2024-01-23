pipeline{
    agent any
    tools {nodejs "node"}
    environment {
        imageName = "rawatbluebell/react-login-app"
        // registryCredential = "rawatbluebell" // credentail for docker hub
        registryCredential="Nexus-Cred" // credentail for Nexus registry
        dockerImage = '3.110.167.229:8082'
        registry=""
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
                    //docker.withRegistry("https://registry.hub.docker.com","dockerhub_creds"){
                        docker.withRegistry("http://"+ registry,"Nexus-Cred"){
                        dockerImage.push("${env.BUILD_NUMBER}")
                    }
                }
            }
        }

    }
}
