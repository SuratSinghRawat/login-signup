pipeline{
    agent any
    tools {nodejs "node"}
    environment {
        imageName = "rawatbluebell/react-login-app"
        // registryCredential = "rawatbluebell" // credentail for docker hub
        registryCredential="Nexus-Cred" // credentail for Nexus registry
        dockerImage = ''
        registry="13.127.160.152:8082"
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
                        docker.withRegistry('http://'+registry,registryCredential){
                        dockerImage.push("${env.BUILD_NUMBER}")
                    }
                }
            }
        }

    }
}
