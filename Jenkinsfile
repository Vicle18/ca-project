pipeline {
  agent any
  stages {
    stage('Unittest') {
      agent {
        docker {
          image 'python:3.7-alpine'
        }

      }
      steps {
        sh 'pip install -r requirements.txt && python tests.py'
      }
    }

    stage('docker image') {
      parallel {
        stage('docker image') {
          environment {
            DockerOrg = 'clemme/'
            DockerRepo = 'ca-project'
          }
          steps {
            sh 'jenkinsScripts/createDockerImage.sh'
          }
        }

        stage('create artifact') {
          agent {
            docker {
              image 'kramos/alpine-zip'
            }

          }
          steps {
            sh 'tar --exclude=\'.git/*\' -zcvf /tmp/ca-project.tar.gz .'
            archiveArtifacts '/tmp/ca-project.tar.gz'
          }
        }

      }
    }

  }
}