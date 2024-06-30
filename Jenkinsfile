pipeline {
    agent any

    environment {
        BASE_IMAGE_NAME = 'java-base'
        APP_IMAGE_NAME = 'java-app'
    }

    stages {
        stage('Declarative: Checkout SCM') {
            steps {
                checkout scm
            }
        }
        
        stage('Clonar Repositorio') {
            steps {
                git 'https://github.com/sulf0nic/ProyectoFase1_Devops.git'
            }
        }

        stage('Construir Imagen Base') {
            steps {
                script {
                    docker.build("${BASE_IMAGE_NAME}", '-f Dockerfile.base .')
                }
            }
        }

        stage('Compilar Aplicación app_java') {
            steps {
                script {
                    sh 'mkdir -p target'
                    sh 'javac -d target src/ChristmasTree.java'
                }
            }
        }

        stage('Empaquetar Aplicación') {
            steps {
                script {
                    sh 'mkdir -p target/META-INF'
                    sh 'cp src/MANIFEST.MF target/META-INF/'
                    sh 'jar cfm target/ChristmasTree.jar target/META-INF/MANIFEST.MF -C target .'
                    sh 'jar tf target/ChristmasTree.jar'
                }
            }
        }

        stage('Construir Imagen de la Aplicación') {
            steps {
                script {
                    docker.build("${APP_IMAGE_NAME}", '.')
                }
            }
        }

        stage('Ejecutar la Aplicación') {
            steps {
                script {
                    sh "docker run --rm ${APP_IMAGE_NAME}"
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
