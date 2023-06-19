#!groovy

pipeline {
  agent {
        label 'baremetal'
  }
  options {
	timestamps()
    ansiColor("xterm")
    buildDiscarder(logRotator(numToKeepStr: "100"))
    timeout(time: 2, unit: "HOURS")
  }
  environment {
      REPOS = 'cakcuk/ansible'
      DISTRO = 'ubuntu2004-ansible ubuntu2204-ansible debian10-ansible debian11-ansible'
  }
    stages {
        stage("Print environment") {
            steps {
                sh 'printenv | sort'
            }
        }


    stage("Build container") {
            when { expression { env.GIT_BRANCH != 'main' } }
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
                sh '''
                    docker login -u ${dockerHubUser} -p ${dockerHubPassword}
                    for distro in $DISTRO
                        do
                            cd ${WORKSPACE}/$distro
                            docker buildx build -t udienz/jenkins-slave:$distro .
                        done
                '''
                }
            } //steps
        } // stage

    stage("Build debian12-ansible") {
            when { expression { env.GIT_BRANCH != 'main' } }
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
                sh '''
                    docker login -u ${dockerHubUser} -p ${dockerHubPassword}
                    for distro in $DISTRO
                        do
                            cd ${WORKSPACE}/$distro
                            docker buildx build -t udienz/jenkins-slave:$distro .
                            docker push -q udienz/jenkins-slave:$distro
                        done
                '''
                }
            } //steps
        } // stage
    } // EOL stages
  post {
    always {
        cleanWs()
        }
  } // eol post
}
