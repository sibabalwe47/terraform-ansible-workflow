pipeline {
    agent any
    environment {
        TF_IN_AUTOMATION = 'true'
        TF_CLI_CONFIG_FILE = credentials('tf-creds')
    }
    stages {
        stage("INIT") {
            steps {
                sh 'env'
                
            }
        }
        // stage("PLAN") {
        //     steps {
        //         sh 'terraform apply -auto-approve -no-color'
        //     }
        // }
    }
}