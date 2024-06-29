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

        stage('Construir Imagen Base Java Base') {
            steps {
                script {
                    sh 'docker build -t ${BASE_IMAGE_NAME} -f Dockerfile.base .'
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
                    sh 'jar cfm target/ChristmasTree.jar src/MANIFEST.MF -C target .'
                    sh 'jar tf target/ChristmasTree.jar'
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

        stage('Verificar Contenido del Contenedor') {
            steps {
                script {
                    sh 'docker run --rm ${APP_IMAGE_NAME} ls -l /home/ec2-user/JavaAplications/target'
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
