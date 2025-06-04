pipeline {
    agent any

    environment {
        IMAGE_NAME = "dan-p81-nginx-app"
        CONTAINER_NAME = "dan-p81-nginx-container"
        DOCKER_PORT = "80"
        HOST_PORT = "8082"
    }

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    if (!fileExists('Dockerfile')) {
                        error "Dockerfile not found!"
                    }
                }
                bat "docker build -t ${IMAGE_NAME} ."
            }
        }

        stage('Stop and Remove Old Container') {
            steps {
                script {
                    bat """
                        docker stop ${CONTAINER_NAME} || exit 0
                        docker rm ${CONTAINER_NAME} || exit 0
                    """
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                bat "docker run -d --name ${CONTAINER_NAME} -p ${HOST_PORT}:${DOCKER_PORT} ${IMAGE_NAME}"
            }
        }

        stage('Success Confirmation') {
            steps {
                echo '✅ Nginx container has been deployed successfully!'
            }
        }
    }

    post {
        failure {
            echo '❌ Pipeline failed. Check the logs for details.'
        }
        always {
            echo 'Pipeline execution finished.'
        }
    }
}
