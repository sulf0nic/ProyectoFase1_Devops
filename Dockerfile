# Dockerfile

# Usar la imagen base que acabamos de crear
FROM javabase

# Copiar el archivo JAR de la aplicación al contenedor
COPY target/ChristmasTree.jar /home/ec2-user/JavaAplications/target

# Copiar el archivo MANIFEST.MF
COPY target/MANIFEST.MF /home/ec2-user/JavaAplications/target

# Definir el comando para ejecutar la aplicación
CMD ["java", "-jar", "ChristmasTree.jar"]

WORKDIR /home/ec2-user/JavaAplications/target
