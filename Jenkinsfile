pipeline {
    agent { dockerfile true }
    stages {
        stage('Test') {
            steps {
                sh 'wget http://localhost'
                sh 'curl http://localhost'
            }
        }
    }
}
