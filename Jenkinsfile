pipeline {
    agent any

    stages {
        stage('Init') {
            steps {
                sh 'terraform init'
            }
        }
        stage('Validate') {
            steps {
                sh 'terraform validate'
            }
        }
        stage('Plan') {
            steps {
                sh 'terraform plan -out=tfplan'
            }
        }
        stage('Apply') {
            steps {
                input message: 'Approve apply?', ok: 'Deploy'
                sh 'terraform apply -auto-approve tfplan'
            }
        }
    }
}
