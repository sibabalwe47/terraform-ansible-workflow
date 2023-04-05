pipeline {
    agent any
    environment {
        TF_IN_AUTOMATION = 'true'
        TF_CLI_CONFIG_FILE = credentials('tf-creds')
    }
    stages {
        stage("INIT") {
            steps {
                sh 'ls'
                sh 'terraform plan -no-color'
            }
        }
        stage("PLAN") {
            steps {
                sh 'terraform plan -no-color'
            }
        }
    }
}