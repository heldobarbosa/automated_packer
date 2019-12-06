provider "aws" {
  region = "us-east-1"
  shared_credentials_file = "/home/heldo/.aws/credentials"
  profile = "Heldo"
}

resource "aws_instance" "imageofpacker" {
  ami = "ami-0ab0c72bf8966e57b"
  instance_type = "t2.micro"
  key_name = "aws_key_pair.my-key.key_name"
  security_groups = ["{aws_security_group.imageofpacker.name}"]
}

resource "aws_key_pair" "my-key" {
  key_name = "my-key"
  public_key = "~/.ssh/id_rsa.pub"
  
}

resource "aws_security_group" "imageofpacker" {
  name = "imageofpacker"
  ingress {
    from_port = 22
    to_port = 22 
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]

  }
  egress {
    from_port = 0 
    to_port = 0
    protocol = -1
    cidr_blocks = ["0.0.0.0/0"]
  }

}
