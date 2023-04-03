pipeline {
    agent any
    stages {
        stage("INIT") {
            steps {
                sh 'ls'
                sh 'terraform --version'
            }
        }
        stage("PLAN") {
            steps {
                sh 'pwd'
                sh 'terraform --version'
            }
        }
    }
}