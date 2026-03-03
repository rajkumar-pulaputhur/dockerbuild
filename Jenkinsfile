pipeline {
    agent any

    environment {
        REGISTRY = "rajkumar-pulaputhur"
        IMAGE_NAME = "sample-nginx"
        TAG = "latest"
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh """
                    docker build -t ${REGISTRY}/${IMAGE_NAME}:${TAG} .
                    """
                }
            }
        }

        stage('Login to Registry') {
            steps {
                script {
                    sh "echo \$DOCKERHUB_PASSWORD | docker login -u \$DOCKERHUB_USERNAME --password-stdin"
                }
            }
        }

        stage('Push Image') {
            steps {
                script {
                    sh "docker push ${REGISTRY}/${IMAGE_NAME}:${TAG}"
                }
            }
        }
    }

    post {
        always {
            cleanWs()
        }
    }
}
