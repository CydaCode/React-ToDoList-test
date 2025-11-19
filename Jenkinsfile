pipeline {
    agent {
        docker {
            image "node:22.21.0-slim"
            args "-u root:root"
        }
    }
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main',
                url: 'https://github.com/CydaCode/React-ToDoList-test.git'
            }
        }
        stage('change directory to dive-react-app') {
            steps {
                dir('dive-react-app')
                echo 'installing all frontend dependencies'
                sh 'npm install'
                echo 'Running lint for for application'
                sh 'npm run lint'
                echo 'running the build'
                sh 'npm run build'
            }
        }
        stage('change directory to backend') {
            steps {
                dir('backend')
                echo 'installing backend dependency'
                sh 'npm install'
                echo 'starting the backend server'
                sh 'npm start'
            }
        }
        
        }
        stage('Build Application') {
            steps {
                sh 'npm run build' // Build the application
            }
            post {
                success {
                    archiveArtifacts 'dist/**/*' // Archive build artifacts
                }
            }
        }
        stage('Deploy to Staging') {
            when {
                branch 'main'
            }
            steps {
                sh 'npm run deploy:staging'
            }
        }
    }
    post {
        always {
            cleanWs() // Clean workspace
        }
        success {
            emailext (
                subject: "SUCCESS: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'",
                body: "The build ${env.BUILD_URL} completed successfully.",
                to: "nwacynti25@gmail.com"
            )
        }
        failure {
            emailext (
                subject: "FAILED: Job '${env.JOB_NAME} [${env.BUILD_NUMBER}]'",
                body: "The build ${env.BUILD_URL} failed. Please check the logs.",
                to: "nwacynti25@gmail.com"
            )
        }
    }
}