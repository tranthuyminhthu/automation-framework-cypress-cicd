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
                bat 'npx cypress run'
            }
        }

stage('Generate and Publish Report') {
    steps {
        bat 'npm run combine-reports'  // Chạy lệnh để kết hợp báo cáo
        bat 'npm run generate-report'   // Chạy lệnh để tạo báo cáo HTML
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
