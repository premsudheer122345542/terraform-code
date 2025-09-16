pipeline {
    agent any

    }

    stages {
        stage('Checkout') {
            steps {
                // Pull your Terraform code repo
                git 'https://github.com/premsudheer122345542/terraform-code.git'
            }
        }

        stage('Init') {
            steps {
                sh '''
                terraform init
                '''
            }
        }

        stage('Validate') {
            steps {
                sh '''
                terraform validate
                '''
            }
        }

        stage('Plan') {
            steps {
                sh '''
                terraform plan -out=tfplan
                '''
            }
        }

        stage('Apply') {
            steps {
                sh '''
                terraform apply -auto-approve tfplan
                '''
            }
        }
    }
}
