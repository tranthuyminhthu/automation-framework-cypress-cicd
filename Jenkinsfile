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
                bat 'npx cypress install --force'
                bat 'npx cypress run --reporter mochawesome' // Thêm reporter nếu cần
            }
        }

        stage('Generate and Publish Report') {
            steps {
                // Kiểm tra xem file mochawesome.json có tồn tại không
                bat 'if exist cypress\\reports\\mocha\\mochawesome.json (npm run combine-reports) else (echo "No mochawesome.json found.")'
                bat 'npm run generate-report' // Chạy lệnh để tạo báo cáo HTML
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
