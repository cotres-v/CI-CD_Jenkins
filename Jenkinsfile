pipeline {
    agent any
    options {
        buildDiscarder(logRotator(artifactDaysToKeepStr: '30'))
        timestamps()
    }
    stages {
        stage('Build_Cat') {
            steps {
                echo 'Building Cat'
                sh 'cd src/cat'
                sh 'make s21_cat'
                archiveArtifacts artifacts: 'src/cat/s21_cat', fingerprint: true
            }
        }
        stage('Build_Grep') {
            steps {
                echo 'Building Grep'
                sh 'cd src/grep'
                sh 'make s21_grep'
                archiveArtifacts artifacts: 'src/cat/s21_grep', fingerprint: true
            }
        }
    }
}