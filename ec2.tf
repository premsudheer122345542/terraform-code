provider "aws" {
    region = "us-east-1"
}

resource "aws_security_group" "vestha" {
    name = "kostha"
    vpc_id = "vpc-0ff908b668e229b91"
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
    ingress {
        from_port = 80
        to_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_instance" "node" {
    ami = "ami-00ca32bbc84273381"
    instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.vestha.id]
    tags = {
        Name = "champutha"
    }
}


