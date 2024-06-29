pipeline {
    agent any

    environment {
        BASE_IMAGE_NAME = 'javabase'
        APP_IMAGE_NAME = 'app_java'
    }

    stages {
        stage('Clonar Repositorio') {
            steps {
                git url: 'https://github.com/sulf0nic/ProyectoFase1_Devops.git', branch: 'master'
               
            }
        }

        stage('Construir Imagen Base') {
            steps {
                script {
                    sh 'docker build -t ${BASE_IMAGE_NAME} -f Dockerfile.base .'
                }
            }
        }

        stage('Compilar Aplicación') {
            steps {
                script {
                    sh 'javac -d target ChristmasTree.java'
                }
            }
        }

        stage('Empaquetar Aplicación') {
            steps {
                script {
                    sh 'jar cf target/ChristmasTree.jar -C target .'
                }
            }
        }

        stage('Construir Imagen de la Aplicación') {
            steps {
                script {
                    sh 'docker build -t ${APP_IMAGE_NAME} .'
                }
            }
        }

        stage('Ejecutar la Aplicación') {
            steps {
                script {
                    sh 'docker run --rm ${APP_IMAGE_NAME}'
                }
            }
        }
    }

    post {
        always {
            script {
                sh 'docker images'
            }
        }
    }
}
