pipeline {
    agent { dockerfile true }
    stages {
        stage('Build') {
            steps {
                sh 'wget https://raw.githubusercontent.com/minepicco/jenkins-test/master/Dockerfile'
                sh 'docker build --no-cache -t minepicco/nginx:test .'
            }
        }
        stage('Scan') {
            steps {
                sh 'twistlockScan ca: "", cert: "", compliancePolicy: "warn", dockerAddress: "unix:///var/run/docker.sock", ignoreImageBuildTime: false, key: "", logLevel: "true", policy: "warn", repository: "minepicco/nginx", requirePackageUpdate: false, tag: "test", timeout: 10'
            }
        }
        stage('Publish') {
            steps {
                sh "twistlockPublish ca: '', cert: '', dockerAddress: 'unix:///var/run/docker.sock', key: '', logLevel: 'true', repository: 'minepicco/nginx', tag: 'test', timeout: 10"
            }
        }
    }
}
