pipeline {
    agent any
    environment {
        TF_IN_AUTOMATION = 'true'
        TF_CLI_CONFIG_FILE = credentials('tf-creds')
    }

    stages {
        stage("INIT") {
            steps {
                echo 'Initialise terraform and set credentials...'
                sh 'export AWS_ACCESS_KEY_ID=$ACCESS_KEY_ID'
                sh 'export AWS_SECRET_ACCESS_KEY=$SECRET_ACCESS_KEY'
                sh 'terraform init -no-color'
            }
        }
        stage('Ansible') {
            steps {
                ansiblePlaybook(credentialsId: 'b2cd9c0a-df0c-4493-a45d-036ee3ff8d80', inventory: 'localhost', playbook: 'ansible/main.yml') 
            }
        }
        stage("PLAN") {
            steps {
                sh 'terraform apply -auto-approve -no-color'
            }
        }
    }
}