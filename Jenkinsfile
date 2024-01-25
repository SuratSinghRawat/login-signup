pipeline{
    agent any
    tools {nodejs "node"}
  
    environment {
        registry="ec2-65-0-23-242.ap-south-1.compute.amazonaws.com:8082/"
            }

    stages{
        stage("Install Dependencies"){
           steps{
             bat 'npm install'
           }
        }

        stage("Upload Artifact"){
            steps{
               bat "npm publish"
                
            }
        }

        

    }
}
