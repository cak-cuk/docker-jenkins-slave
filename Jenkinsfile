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
  }
    stages {
        stage("Print environment") {
            steps {
                sh 'printenv | sort'
            }
        }


    stage("Build ubuntu2004") {
            when { expression { env.GIT_BRANCH != 'main' } }
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
                sh '''
                    docker login -u ${dockerHubUser} -p ${dockerHubPassword}
                    cd ${WORKSPACE}/ubuntu2004
                    docker buildx build -t udienz/jenkins-slave:ubuntu2004
                '''
                }
            } //steps
        } // stage

    stage("Build ubuntu2204") {
            when { expression { env.GIT_BRANCH != 'main' } }
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
                sh '''
                    docker login -u ${dockerHubUser} -p ${dockerHubPassword}
                    cd ${WORKSPACE}/ubuntu2204
                    docker buildx build -t udienz/jenkins-slave:ubuntu2204
                '''
                }
            } //steps
        } // stage

    stage("Build debian10") {
            when { expression { env.GIT_BRANCH != 'main' } }
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
                sh '''
                    docker login -u ${dockerHubUser} -p ${dockerHubPassword}
                    cd ${WORKSPACE}/debian10
                    docker buildx build -t udienz/jenkins-slave:debian10
                '''
                }
            } //steps
        } // stage

    stage("Build debian11") {
            when { expression { env.GIT_BRANCH != 'main' } }
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
                sh '''
                    docker login -u ${dockerHubUser} -p ${dockerHubPassword}
                    cd ${WORKSPACE}/debian11
                    docker buildx build -t udienz/jenkins-slave:debian11
                '''
                }
            } //steps
        } // stage

    stage("Build debian12") {
            when { expression { env.GIT_BRANCH != 'main' } }
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
                sh '''
                    docker login -u ${dockerHubUser} -p ${dockerHubPassword}
                    cd ${WORKSPACE}/debian12
                    docker buildx build -t udienz/jenkins-slave:debian12
                '''
                }
            } //steps
        } // stage

    stage("Build ubuntu2004-ansible") {
            when { expression { env.GIT_BRANCH != 'main' } }
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
                sh '''
                    docker login -u ${dockerHubUser} -p ${dockerHubPassword}
                    cd ${WORKSPACE}/ubuntu2004-ansible
                    docker buildx build -t udienz/jenkins-slave:ubuntu2004-ansible
                '''
                }
            } //steps
        } // stage

    stage("Build ubuntu2204-ansible") {
            when { expression { env.GIT_BRANCH != 'main' } }
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
                sh '''
                    docker login -u ${dockerHubUser} -p ${dockerHubPassword}
                    cd ${WORKSPACE}/ubuntu2204-ansible
                    docker buildx build -t udienz/jenkins-slave:ubuntu2204-ansible
                '''
                }
            } //steps
        } // stage

    stage("Build debian10-ansible") {
            when { expression { env.GIT_BRANCH != 'main' } }
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
                sh '''
                    docker login -u ${dockerHubUser} -p ${dockerHubPassword}
                    cd ${WORKSPACE}/debian10-ansible
                    docker buildx build -t udienz/jenkins-slave:debian10-ansible
                '''
                }
            } //steps
        } // stage

    stage("Build debian11-ansible") {
            when { expression { env.GIT_BRANCH != 'main' } }
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerHub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
                sh '''
                    docker login -u ${dockerHubUser} -p ${dockerHubPassword}
                    cd ${WORKSPACE}/debian11-ansible
                    docker buildx build -t udienz/jenkins-slave:debian11-ansible
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
                    cd ${WORKSPACE}/debian12-ansible
                    docker buildx build -t udienz/jenkins-slave:debian12-ansible
                '''
                }
            } //steps
        } // stage

        stage("Simulate the playbook") {
            when { expression { env.GIT_BRANCH != 'origin/main' } }
            steps {
                sh 'echo "do whatever"'
                }
        }
        stage("Run the playbook") {
            when { expression { env.GIT_BRANCH == 'origin/main' } }
            steps {
                sh 'echo "do whatever"'
                }
        }
    } // EOL stages
  post {
    always {
        cleanWs()
        }
  } // eol post
}
