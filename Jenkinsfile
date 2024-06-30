pipeline {
    agent any

    environment {
        BASE_IMAGE_NAME = 'java-base'
        APP_IMAGE_NAME = 'java-app'
    }

    stages {
        stage('Clonar Repositorio') {
            steps {
                git 'https://github.com/sulf0nic/ProyectoFase1_Devops.git'
            }
        }

        stage('Construir Imagen Base Java') {
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
                    sh 'cp src/MANIFEST.MF target/'
                    sh 'jar cfm target/ChristmasTree.jar target/MANIFEST.MF -C target .'
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

        stage('Verificar Contenido del Contenedor') {
            steps {
                script {
                    docker.image("${APP_IMAGE_NAME}").inside {
                        sh 'ls -l /home/ec2-user/JavaAplications/target'
                    }
                }
            }
        }

        stage('Ejecutar la Aplicación') {
            steps {
                script {
                    docker.image("${APP_IMAGE_NAME}").inside {
                        sh 'java -jar /home/ec2-user/JavaAplications/target/ChristmasTree.jar'
                    }
                }
            }
        }
    }
}
