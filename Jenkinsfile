pipeline {
    agent any

    stages {
        stage('Terraform init') {
            steps {
                sh 'terraform init'
            }

        }

        stage('Terraform plan') {
            steps {
                sh 'terraform plan'
            }

        }

        stage('Terraform aproval') {
            steps {
                input message: 'Apply this to terraform?', ok: 'yes'
            }

        }
        stage('Terraform apply') {
            steps {
                sh 'terraform apply --auto-approve'
            }

        }
    }
}
