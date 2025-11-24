pipeline {
    agent any
    // environment {
    //     DOCKER_USERNAME=credentials("DOCKER_USERNAME")
    //     DOCKER_PASSWORD=crendetials("DOCKER_PASSWORD")
    //     EC2_KEY=credentials("EC2_KEY")
    //     EC2_HOST=credentials(EC2_HOST)
    // }
    stages {
        stage("Checkout code") {
            steps {
                git branch: "main",
                url: "https://github.com/CydaCode/React-ToDoList-test.git"
            }
        }
        stage("Build image and push") {

            steps {
                withCredentials([
                    usernamePassword(credentialsId:'docker_creds', usernameVariable:'DOCKER_USERNAME', passwordVariable:'DOCKER_PASSWORD')
                ]) {
                    sh'''
                        chmod 777 buildscript.sh
                        ./buildscript.sh
                    '''
                }
                
            }
        }
        stage("Deploy to EC2") {
            steps {
                withCredentials([
                    sshUserPrivateKey(credentialsId:'EC2_KEY', keyFileVariable:'EC2_KEY'),
                    string(credentialsId:'EC2_HOST', variable:'EC2_HOST'),
                    usernamePassword(credentialsId:'docker_creds', usernameVariable:'DOCKER_USERNAME', passwordVariable:'DOCKER_PASSWORD')
                ]) {
                    sh'''
                        chmod 600 $EC2_KEY
                        ssh -o StrictHostKeyChecking=no -i $EC2_KEY ubuntu@$EC2_HOST <<EOF
                        echo "Connected to EC2"
                        export DOCKER_USERNAME="$DOCKER_USERNAME"
                        export DOCKER_PASSWORD="$DOCKER_PASSWORD"
                        cd /home/ubuntu/React-TodoList
                        bash ~/React-Todolist/deploy.sh
                    EOF
                    '''
                }
            }
        }
    }

}