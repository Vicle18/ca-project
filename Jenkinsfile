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
        stash(name: 'source', excludes: '.git')
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
            unstash 'source'
            sh '-r ca-project.zip .'
            archiveArtifacts 'ca-project.zip'
          }
        }

      }
    }

  }
}