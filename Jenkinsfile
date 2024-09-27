pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Install Dependencies') {
            steps {
  bat 'npm run test'
            }
        }

        stage('Run Cypress Tests') {
            steps {
                bat 'npm cypress run' // Sử dụng lệnh test đã được định nghĩa trong package.json
            }
        }
    }
    post {
        always {
            cleanWs()
        }
        success {
            echo 'Build succeeded!'
        }
        failure {
            echo 'Build failed.'
        }
    }
}