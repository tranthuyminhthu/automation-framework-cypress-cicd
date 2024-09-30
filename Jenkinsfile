pipeline {  
    agent {  
        label 'win-agent'  
    }  
  
    stages {  
        stage('Checkout') {  
            steps {  
                checkout scm  
            }  
        }  
  
        stage('Install Dependencies') {  
            steps {  
                powershell 'npm install'  
            }  
        }  
  
        stage('Run Cypress Tests') {  
            steps {  
                powershell 'npm run test' // Sử dụng lệnh test đã được định nghĩa trong package.json  
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