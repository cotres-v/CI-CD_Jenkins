pipeline {
    agent any
    options {
        buildDiscarder(logRotator(artifactDaysToKeepStr: '30'))
        timestamps()
    }
    stages {
        stage('Checkout') {
            steps {
                echo 'step Git Checkout'
                checkout scm
            }
        }
        stage('Build_Cat') {
            steps {
                echo 'step Building Cat'
                dir('src/cat') {
                    sh 'make s21_cat'
                }
                archiveArtifacts artifacts: 'src/cat/s21_cat', fingerprint: true
            }
        }
        stage('Build_Grep') {
            steps {
                echo 'step Building Grep'
                dir ('src/grep') {
                    sh 'make s21_grep'
                }
                archiveArtifacts artifacts: 'src/grep/s21_grep', fingerprint: true
            }
        }
        stage('Clang_Format') {
            steps {
                echo 'step Clang Format Check'
                dir ('src/') {
                    script {
                        def errors = sh(script: 'clang-format --dry-run --style=Google --Werror cat/*.c grep/*.c', returnStatus: true)
                        if (errors != 0) {
                            echo "Code style errors found!"
                            sh 'clang-format --dry-run --style=Google --Werror cat/*.c grep/*.c'
                            error("Code style check failed") 
                        } else {
                            echo "Code style is OK."
                        }
                    }
                }
            }
        }
        stage('Test_Cat') {
            steps {
                echo 'step Testing Cat'
                dir('src/cat') {
                    sh 'bash test_cat.sh'
                }
            }
        }
        stage('Test_Grep') {
            steps {
                echo 'step Testing Grep'
                dir('src/grep') {
                    sh 'bash test_grep.sh'
                }
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying Cat and Grep'
                dir('src') {
                    sh 'bash deploy.sh'
                }
            }
        }
    }
}