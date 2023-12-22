pipeline{
    agent any
    tools {nodejs "node"}
    stages{
        stage("Install Dependencies"){
            steps{
                sh 'install npm@6.14.15'
            }
        }

        stage("Test"){
            steps{
                sh 'npm test'
            }
        }

    }
}