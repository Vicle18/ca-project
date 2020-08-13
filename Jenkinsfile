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
        stash 'source'
        sh 'pip install -r requirements.txt && python tests.py'
      }
    }

    stage('create artifacts') {
      when{branch 'master'}
      parallel {
        stage('dockerize') {
          environment {
            DockerOrg = 'clemme/'
            DockerRepo = 'ca-project'
          }
          steps {
            unstash 'source'
            sh 'jenkinsScripts/createDockerImage.sh'
          }
        }

        stage('create tar') {
          agent any
          steps {
            unstash 'source'
            sh 'tar --exclude=.git --exclude=.dockerignore --exclude=VERSION --exclude=jenkinsScripts --exclude=docs --exclude=Dockerfile --exclude=Jenkinsfile --exclude=tests.py --exclude=README.md --exclude=.gitignore --exclude=CONTRIBUTING.md -zcvf /tmp/ca-project.tar.gz .'
            dir(path: '/tmp') {
              archiveArtifacts 'ca-project.tar.gz'
            }

          }
        }

      }
    }

  }
}
