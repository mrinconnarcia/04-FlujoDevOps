pipeline {
    agent any

    environment {
        DOCKERIMAGE = "node-hello-world"
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
                branch 'main'
            }
            steps {
                script {
                    // Detener y eliminar el contenedor anterior si existe
                    def previousContainer = sh(script: "docker ps -q --filter 'name=node-hello-world'", returnStdout: true).trim()
                    if (previousContainer) {
                        sh "docker stop ${previousContainer}"
                        sh "docker rm ${previousContainer}"
                    }
                    // Ejecutar el nuevo contenedor
                    docker.image(DOCKERIMAGE).run('-d -p 3004:3000 --name node-hello-world')
                }
            }
        }
    }
}
