pipeline {
    agent any
    environment {
        TF_IN_AUTOMATION = 'true'
        TF_CLI_CONFIG_FILE = credentials('tf-creds')
    }
    stages {
        stage("INIT") {
            steps {
                echo TF_CLI_CONFIG_FILE
                sh 'terraform init -no-color'
                
            }
        }
        stage("PLAN") {
            steps {
                sh 'terraform plan -no-color'
            }
        }
    }
}