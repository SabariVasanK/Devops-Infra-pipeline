pipeline {
  agent any

  environment {
    ENV = "${env.BRANCH_NAME}"
    TF_WORKDIR = "environments/${env.BRANCH_NAME}"
  }

  stages {
    stage('Checkout') {
      steps {
        git branch: "${env.BRANCH_NAME}", url: 'https://github.com/SabariVasanK/Devops-Infra-pipeline.git', credentialsId: 'Github-credentials'
      }
    }

    stage('Terraform Init') {
      steps {
        dir("${TF_WORKDIR}") {
          withCredentials([
            string(credentialsId: 'aws-access-key-id', variable: 'AWS_ACCESS_KEY_ID'),
            string(credentialsId: 'aws-secret-access-key', variable: 'AWS_SECRET_ACCESS_KEY')
          ]) {
            sh 'terraform init'
          }
        }
      }
    }

    stage('Terraform Plan') {
      steps {
        dir("${TF_WORKDIR}") {
          withCredentials([
            string(credentialsId: 'aws-access-key-id', variable: 'AWS_ACCESS_KEY_ID'),
            string(credentialsId: 'aws-secret-access-key', variable: 'AWS_SECRET_ACCESS_KEY')
          ]) {
            sh 'terraform plan -out=tfplan'
            sh 'terraform show -no-color tfplan > tfplan.txt'
            sh 'cat tfplan.txt'
          }
        }
      }
    }

    stage('Approval') {
      steps {
        input message: "Approve the deployment to production?", ok: 'Deploy'
      }
    }

    stage('Terraform Apply') {
      steps {
        dir("${TF_WORKDIR}") {
          withCredentials([
            string(credentialsId: 'aws-access-key-id', variable: 'AWS_ACCESS_KEY_ID'),
            string(credentialsId: 'aws-secret-access-key', variable: 'AWS_SECRET_ACCESS_KEY')
          ]) {
            sh 'terraform apply tfplan'
          }
        }
      }
    }
  }
}