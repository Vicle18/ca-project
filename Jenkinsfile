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

    stage('docker image') {
      agent {
        node {
          label 'master-label'
        }

      }
      environment {
        DockerOrg = 'clemme'
        DockerRepo = 'ca-project'
      }
      steps {
        sh 'docker --version && jenkinsScripts/createDockerImage.sh'
      }
    }

  }
}