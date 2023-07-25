resource "aws_security_group" "elb-sg" {
    name = "elb-sg"
    description = "Security group for bean elastic load balancer"
    vpc_id = "module.vpc.vpc_id"
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 80
        tp_port = 80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

resource "aws_security_group" "bastion-host-sg" {
    name = "bastion-host-sg"
    description = "Security group for bastion host"
    vpc_id = "module.vpc.vpc_id"
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 22
        tp_port = 22
        protocol = "tcp"
        cidr_blocks = [var.MY_IP]
    }
}

resource "aws_security_group" "bean-instances-sg" {
    name = "bean-instances-sg"
    description = "Security group for instances in beanstalk"
    vpc_id = "module.vpc.vpc_id"
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 22
        tp_port = 22
        protocol = "tcp"
        cidr_blocks = [aws_security_group.bastion-host-sg.id]
    }
}

resource "aws_security_group" "backend-instances-sg" {
    name = "backend-instances-sg"
    description = "Security group for instances in backend"
    vpc_id = "module.vpc.vpc_id"
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 0
        tp_port = 0
        protocol = "-1"
        cidr_blocks = [aws_security_group.bean-instances-sg.id]
    }
}

resource "aws_security_group_rule" "sg-allow-internal-traffic" {
    type = "ingress"
    from_port = 0
    to_port = 65535
    protocol = "tcp"
    security_group_id = aws_security_group.backend-instances-sg.id
    source_security_group_id = aws_security_group.backend-instances-sg.id
}