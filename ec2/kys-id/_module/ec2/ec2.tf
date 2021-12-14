resource "aws_security_group" "ec2" {
  name        = "${var.service_name}-${var.vpc_name}"
  description = "${var.service_name} Instance Security Group"
  vpc_id      = var.target_vpc

  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"

    cidr_blocks = var.ext_lb_ingress_cidrs

    description = "SSH port"
  }

  // 20212114 alb 수정 관련 박재형 시작
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80

    description = "HTTP port"
  }
  // 20212114 alb 수정 관련 박재형 끝


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["10.0.0.0/8"]
    description = "Internal outbound traffic"
  }


  egress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Internal outbound traffic"
  }

  egress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Internal outbound traffic"
  }
}

resource "aws_instance" "public_ec2" {
  ami                    = var.base_ami
  instance_type          = var.instance_type
  key_name               = var.key_name
  iam_instance_profile   = var.instance_profile
  subnet_id              = var.public_subnets[0]
  vpc_security_group_ids = [aws_security_group.ec2.id]
  ebs_optimized          = var.ebs_optimized

  root_block_device {
    volume_size = "10"
  }

  tags = {
    Name  = "${var.service_name}-${var.stack}"
    app   = "${var.service_name}"
    stack = var.stack
  }

}

// 20212114 alb 수정 관련 박재형 시작
/*
# Security Group
## public Seucurity Group
resource "aws_security_group" "publicSG01" {
  name = "public-SG-01"
  description = "Allow all HTTP"
  vpc_id = aws_vpc.test.id
  ingress {
    cidr_blocks = [ "0.0.0.0/0" ]
    from_port = 80
    protocol = "tcp"
    to_port = 80
  }

  egress {
    cidr_blocks = [ "0.0.0.0/0" ]
    from_port = 0
    protocol = "-1"
    to_port = 0
  }
}

## private Security Group
resource "aws_security_group" "privateEC2SG01" {
  name = "private-ec2-sg-01"
  description = "Allow HTTP from ALB"
  vpc_id = aws_vpc.test.id
  ingress = [ {
    cidr_blocks = null
    description = null
    from_port = 80
    ipv6_cidr_blocks = null
    prefix_list_ids = null
    protocol = "tcp"
    security_groups = [ aws_security_group.publicSG01.id ]
    self = false
    to_port = 80
  } ]

  egress = [ {
    cidr_blocks = [ "0.0.0.0/0" ]
    description = null
    from_port = 0
    ipv6_cidr_blocks = null
    prefix_list_ids = null
    protocol = "-1"
    security_groups = null
    self = false
    to_port = 0
  } ]
}
*/
// 20212114 alb 수정 관련 박재형 끝
