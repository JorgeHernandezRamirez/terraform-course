data "template_file" "my_template_file" {
  template = "${file("script/mytemplate.tpl")}"
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
  owners = ["099720109477"]
}

resource "aws_instance" "mymachine" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"
  key_name      = aws_key_pair.mykeypair.key_name
  vpc_security_group_ids = [aws_security_group.custom-sg.id]
  subnet_id = module.vpc.public_subnets[0]
  #user_data = data.template_file.my_template_file.rendered
  tags          = {
    "Name" = "mymachine"
  }
}