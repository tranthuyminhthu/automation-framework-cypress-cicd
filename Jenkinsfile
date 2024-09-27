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
                bat 'npm install'
            }
        }

        stage('Run Cypress Tests') {
            steps {
                bat 'npm run test' // Sử dụng lệnh test đã được định nghĩa trong package.json
            }
        }

        stage('Generate and Publish Report') {
            steps {
                script {
                    // Kiểm tra xem file mochawesome.json có tồn tại không
                    bat 'if exist cypress\\reports\\mocha\\mochawesome.json (echo Report exists) else (echo Report not found)'

                    // Chạy lệnh để tạo báo cáo HTML
                    bat 'npm run generate-report'
                }
                publishHTML(target: [
                    allowMissing: false,
                    alwaysLinkToLastBuild: true,
                    keepAll: true,
                    reportDir: 'cypress/reports/mochareports',
                    reportFiles: 'report.html',
                    reportName: 'Mochawesome Report'
                ])
            }
        }

        stage('Archive Artifacts') {
            steps {
                archiveArtifacts artifacts: 'cypress/reports/mochareports/*.html', allowEmptyArchive: true
                archiveArtifacts artifacts: 'cypress/reports/mochareports/*.json', allowEmptyArchive: true
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