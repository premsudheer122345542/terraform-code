pipeline {
    agent any

    environment {
        // AWS creds stored in Jenkins → Credentials → "Username with password"
        // Example ID: aws-creds
        AWS_CREDS = credentials('aws-creds-id')
    }

    stages {
        stage('Checkout') {
            steps {
                // Jenkins automatically checks out when you use "Pipeline from SCM",
                // so you can remove this stage if you like.
                checkout scm
            }
        }

        stage('Terraform Init') {
            steps {
                sh '''
                  export AWS_ACCESS_KEY_ID=$AWS_CREDS_USR
                  export AWS_SECRET_ACCESS_KEY=$AWS_CREDS_PSW
                  terraform init
                '''
            }
        }

        stage('Terraform Plan') {
            steps {
                sh '''
                  export AWS_ACCESS_KEY_ID=$AWS_CREDS_USR
                  export AWS_SECRET_ACCESS_KEY=$AWS_CREDS_PSW
                  terraform plan
                '''
            }
        }

        stage('Terraform Apply') {
            steps {
                sh '''
                  export AWS_ACCESS_KEY_ID=$AWS_CREDS_USR
                  export AWS_SECRET_ACCESS_KEY=$AWS_CREDS_PSW
                  terraform apply -auto-approve
                '''
            }
        }
    }
}
