#
# DO NOT DELETE THESE LINES!
#
# Your subnet ID is:
#
#     subnet-51ab1e09
#
# Your security group ID is:
#
#     sg-01272d66
#
# Your AMI ID is:
#
#     ami-8328bbf0
#
# Your Identity is:
#
#     capgemini-9bf31c7ff062936a96d3c8bd1f8f2ff3
#
# variable "aws_access_key" {}
# variable "aws_secret_key" {}
# variable "aws_region" {
#  default = "eu-west-1"
# }  
provider "dnsimple" {
	email = "this-is-a-test@hello.com"
	Token = "1234qwer"
}

provider "aws" {
 access_key = "AKIAIBA5WLWOKMHQDJ2Q"
 secret_key = "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"
 region     = "eu-west-1"
 # access_key = "${var.aws_access_key}"
 # secret_key = "${var.aws_secret_key}" 
 # region     = "${var.aws_region}" 
}

resource "dnsimple" "example" {
	domain = "terraform.rocks"
	type = "A"
	name = "..."
	value = "${aws_instance.web.o.public_ip}
}

resource "aws_instance" "web" {
  ami = "ami-8328bbf0"
  instance_type = "t2.micro"
  subnet_id = "subnet-51ab1e09"
  vpc_security_group_ids = ["sg-01272d66"]

  tags {
	name = "Sheepy"
	description = "its_Mine"
	other = "bom"
}

}

 output "public_ip" {
  value = "${aws_instance.web.public_ip}"
 }

 output "public_dns" {
  value = "${aws_instance.web.public_dns}"
 }

