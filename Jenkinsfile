pipeline {
    agent any

    environment {
        DOCKERIMAGE = "node-hello-world"
        CONTAINERNAME = "node-hello-world-container"
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/mrinconnarcia/04-FlujoDevOps.git'
            }
        }

        stage('Build') {
            steps {
                script {
                    docker.build(DOCKERIMAGE)
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    docker.image(DOCKERIMAGE).inside {
                        sh 'npm install'
                        sh 'npm test'
                    }
                }
            }
        }

        stage('Deploy') {
            when {
                branch 'master'
            }
            steps {
                script {
                    // Detener y eliminar el contenedor anterior si existe
                    def previousContainer = sh(script: "docker ps -q --filter 'name=${CONTAINERNAME}'", returnStdout: true).trim()
                    if (previousContainer) {
                        sh "docker stop ${previousContainer}"
                        sh "docker rm ${previousContainer}"
                    }
                    // Ejecutar el nuevo contenedor con un nombre específico
                    docker.image(DOCKERIMAGE).run("-d -p 3004:3000 --name ${CONTAINERNAME}")
                }
            }
        }
    }
}
