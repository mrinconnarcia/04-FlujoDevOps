pipeline {
  agent any

  environment {
    DOCKERIMAGE = "node-hello-world"
    HOME = "."
  }

  stages {
    stage ('Build') {
      steps {
        script {
          docker.build(DOCKERIMAGE)
        }
      }
    }

    stage ('Test') {
      steps {
        script {
          docker.image(DOCKERIMAGE).inside {
            sh 'npm install'
            sh 'npm test'
          }
        }
      }
    }
    stage ('Deploy') {
      steps {
        script {
          docker.image(DOCKERIMAGE).run('-d -p 3004:3000')
        }
      }
    }
  }
}