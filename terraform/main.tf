provider "aws" {
  region = "us-east-1"
}

# 🔐 variable for DB password
variable "db_password" {
  description = "RDS password"
  type        = string
}

# 🖥️ EC2
resource "aws_instance" "ec2" {
  ami           = "ami-0c02fb55956c7d316"
  instance_type = "t2.micro"

  tags = {
    Name = "java-app"
  }
}

# 🗄️ RDS PostgreSQL
resource "aws_db_instance" "rds" {
  allocated_storage    = 20
  engine               = "postgres"
  instance_class       = "db.t3.micro"
  username             = "postgres"
  password             = var.db_password   # ✅ FIXED
  skip_final_snapshot  = true

  publicly_accessible = true
}