provider "aws" {
  alias  = "us-east-1"
  region = "us-east-1"
}

provider "aws" {
  alias  = "us-west-1"
  region = "us-west-1"
}

resource "aws_instance" "instance_1" {
  provider      = aws.us-east-1
  ami          = "ami-014d544cfef21b42d"  # Updated AMI for us-east-1
  instance_type = "t2.micro"
  tags = {
    Name = "Instance-US-East-1"
  }
}

resource "aws_instance" "instance_2" {
  provider      = aws.us-west-1
  ami          = "ami-00114ce822919b9d0"  # Updated AMI for us-west-1
  instance_type = "t2.micro"
  tags = {
    Name = "Instance-US-West-1"
  }
}

output "instance_1_public_ip" {
  value = aws_instance.instance_1.public_ip
}

output "instance_2_public_ip" {
  value = aws_instance.instance_2.public_ip
}
