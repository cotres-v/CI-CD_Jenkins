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
                cd src/cat
                make s21_cat
                archiveArtifacts artifacts: 'src/cat/s21_cat', fingerprint: true
            }
        }
        stage('Build_Grep') {
            steps {
                echo 'Building Grep'
                cd src/grep
                make s21_grep
                archiveArtifacts artifacts: 'src/cat/s21_grep', fingerprint: true
            }
        }
    }
}