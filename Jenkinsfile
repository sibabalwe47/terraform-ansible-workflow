pipeline {
    agent any
    environment {
        TF_IN_AUTOMATION = 'true'
        TF_CLI_CONFIG_FILE = credentials('tf-creds')
    }
    stages {
        stage("INIT") {
            steps {
                echo '$AWS_DEFAULT_REGION'
                echo '$AWS_SECRET_ACCESS_KEY'
                echo '$AWS_ACCESS_KEY_ID'
                
            }
        }
        // stage("PLAN") {
        //     steps {
        //         sh 'terraform apply -auto-approve -no-color'
        //     }
        // }
    }
}