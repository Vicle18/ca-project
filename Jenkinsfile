pipeline {
  agent {
    docker {
      image 'python:3.7-alpine'
    }

  }
  stages {
    stage('Unittest') {
      steps {
        sh 'pip install -r requirements.txt && python tests.py'
      }
    }

  }
}