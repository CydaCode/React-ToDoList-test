pipeline {
    agent any
    environment {
        DOCKER_USERNAME=credentials("DOCKER_USERNAME")
        DOCKER_PASSWORD=crendetials("DOCKER_PASSWORD")
        EC2_KEY=credentials("EC2_KEY")
        EC2_HOST=credentials(EC2_HOST)
    }
    stages {
        stage("Checkout code") {
            steps {
                git branch: "main",
                url: "https://github.com/CydaCode/React-ToDoList-test.git"
            }
        }
        stage("Build image and push") {
            agent {
                docker {
                    image 'docker:stable'
                    args '-v /var/run/docker.sock:/var/run/docker.sock'
                }
            }
            steps {
                sh 'chmod 777 buildscript.sh'
                sh './buildscript.sh'
            }
        }
        //stage("Deploy to EC2") {
            //steps {
                //writeFile file: 'deployment_key.pem'
                //text: 'EC2_KEY'
                //sh 'chmod 600 deployment_key.pem'
            //}
        //}
    }

}