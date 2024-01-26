pipeline{
    agent any
    tools {nodejs "node"}   

    stages{
        stage("Install Dependencies"){
           steps{
             bat 'npm install'
           }
        }

        stage("Upload Artifact"){
            steps{
               sh 'npm publish'
                
            }
        }

        

    }
}
