resource "aws_instance" "exampleF3" {
  ami           = "ami-06c68f701d8090592"  # ID de la AMI que se utilizará
  instance_type = "t2.micro"              # Tipo de instancia EC2
  subnet_id     = "subnet-05461e737d22d8649"  # ID de la subred donde se lanzará la instancia
  key_name      = "Produccion"                  # Nombre de la clave SSH para acceder a la instancia

  tags = {
    Terraform   = "true"   # Etiqueta para indicar que la instancia fue creada con Terraform
    Environment = "CICD"   # Etiqueta para el entorno de la instancia
    Name        = "Project_3"  # Nombre de la instancia
  }
}