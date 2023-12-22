pipeline{
    agent any
    tools {nodejs "node"}
    stages{
        stage("Install Dependencies"){
            steps{
                sh 'npm install@6.14.15'
            }
        }

        stage("Test"){
            steps{
                sh 'npm install'
            }
        }

    }
}