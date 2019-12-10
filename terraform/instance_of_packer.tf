provider "aws" {
  region = "us-east-1"
#  shared_credentials_file = "/home/heldo/.aws/credentials"
  profile = "Heldo"
}

   resource "aws_key_pair" "my-key" {
    key_name = "my-key"
    public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCgXjRFblNhoI1g7cvYc0IgOySI6brhBoK++IozOS5IjKhgl7EEKffiiMO6RCcyWV0zjddLXnkGrNfA7Juy3pz/zN8ND6Y/BgbuEfIOHX3C7W+7haNo7B1RdOCpzgXvAcRN3EQNgKODFK1R2q5DoQV74jMWSgdwat/Ve+L96aBkFnTWGGzv5/IX0iP1DignrzLSagHvE70jmv3I/VsjUIHFEYcQk4Wuzgsne0w82GpgxfcWFfIOEtLoHWtcJmiVgcIkDqsD/x5PwkqG/4qWNNfVqgxUlssIgOL5zouMClWF9yReeuldk5sOQV79opf0bSKa9dk26eXzNffan9NFCd6JB83OhL/Lrl6gSXoMu/IFj3Js3bvfQOurdf3xetacek6nvqr5JAImyKnbt43/TRsfD4vv0ftrgI53WCm5NROT3/jvPnfRXJUQnmWgITTx/J/s6cAGwSU0UDi6GcKgrWTLF0si5ps/QxEZIC+YwChu59dgVEKebW97yMHKWlZez3E= heldo@heldo-Latitude-3490"

  }
resource "aws_instance" "imageofpacker1" {
  ami = "ami-0274693c55e40cd33"
  instance_type = "t2.micro"
  key_name = "my-key"
  security_groups = ["${aws_security_group.imageofpacker1.name}"]
}

resource "aws_security_group" "imageofpacker1" {
  vpc_id =  "vpc-fc37ae86"
  name = "imageofpacker1"

  egress {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
      from_port = 443
      to_port = 443
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
      from_port = 80
      to_port = 80
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
      from_port = 443
      to_port = 443
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port       = "22"
        to_port         = "22"
        protocol        = "tcp"
        cidr_blocks = [ "177.70.100.10/32" ]
    }
  }
