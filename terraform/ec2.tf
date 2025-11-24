resource "aws_key_pair" "instance_key" {
  key_name   = "wanderlust-key"
  public_key = file("wanderlust-key.pub")
}

resource "aws_default_vpc" "default" {

}

resource "aws_security_group" "instance_sg" {
  name   = "wanderlust-sg"
  vpc_id = aws_default_vpc.default.id

  ingress {
    description = "ssh port"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "redis port"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "mongo db"
    from_port   = 27017
    to_port     = 27017
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "mongo db"
    from_port   = 27017
    to_port     = 27017
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "frontend port"
    from_port   = 5173
    to_port     = 5173
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "backend port"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "wanderlust-sg"

  }
}

resource "aws_instance" "wanderlust_ins" {
  ami             = var.ami_id
  instance_type   = var.instance_type
  key_name        = aws_key_pair.instance_key.key_name
  security_groups = [aws_security_group.instance_sg.name]

  tags = {
    Name = "wanderlust-ins"

  }

  root_block_device {
    volume_size = 20
    volume_type = "gp3"
  }

}
