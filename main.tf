resource "aws_instance" "exampleF3" {
  ami           = "ami-08be1e3e6c338b037"  # ID de la AMI que se utilizará
  instance_type = "t2.micro"              # Tipo de instancia EC2
  subnet_id     = "subnet-02c29b0d763be0fbc"  # ID de la subred donde se lanzará la instancia
  key_name      = "Fase3"                  # Nombre de la clave SSH para acceder a la instancia

  tags = {
    Terraform   = "true"   # Etiqueta para indicar que la instancia fue creada con Terraform
    Environment = "CICD"   # Etiqueta para el entorno de la instancia
    Name        = "Project_3"  # Nombre de la instancia
  }
}