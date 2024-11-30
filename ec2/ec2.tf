resource "aws_security_group" "ssh_security" {
  name = "SSH_securitygroup"
  description = "This is SSH security group"

  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "SSh_securitygp"
  }

}

resource "aws_instance" "terraform" {

    ami = "ami-09c813fb71547fc4f"
    instance_type = "t3.micro"
    vpc_security_group_ids= [aws_security_group.ssh_security.id]

    tags = {
    Name = "terraform_instance"
  
    }

  }

