pipeline {
    agent any
    environment {
        TF_IN_AUTOMATION = 'true'
        TF_CLI_CONFIG_FILE = credentials('tf-creds')
    }
    stages {
        stage("INIT") {
            steps {
                sh '$AWS_SECRET_ACCESS_KEY'
                sh '$AWS_ACCESS_KEY_ID'
                sh '$AWS_DEFAULT_REGION'
                
            }
        }
        // stage("PLAN") {
        //     steps {
        //         sh 'terraform apply -auto-approve -no-color'
        //     }
        // }
    }
}