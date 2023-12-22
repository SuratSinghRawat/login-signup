pipeline{
    agent any
    tools {nodejs "node"}
    stages{
        stage("Install Dependencies"){
            steps{
                sh 'npx npm@6.14.15 install'
            }
        }

        stage("Test"){
            steps{
                sh 'npm test'
            }
        }

    }
}