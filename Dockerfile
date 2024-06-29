# Dockerfile

# Usar la imagen base que acabamos de crear
FROM javabase

# Copiar el archivo JAR de la aplicación al contenedor
COPY target/ChristmasTree.jar /home/ec2-user/JavaAplications/ChristmasTree.jar

# Definir el comando para ejecutar la aplicación
CMD ["java", "-jar", "ChristmasTree.jar"]