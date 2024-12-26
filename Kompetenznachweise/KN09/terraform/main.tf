provider "aws" {
  region = var.aws_region
}

resource "aws_security_group" "db_sg" {
  name        = var.security_group_name
  description = "Allow MySQL traffic"

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = var.security_group_name
  }
}

resource "aws_instance" "database_server" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  security_groups = [aws_security_group.db_sg.name]

  user_data = file("cloud-init-db.yaml")

  tags = {
    Name = var.instance_name
  }
}
