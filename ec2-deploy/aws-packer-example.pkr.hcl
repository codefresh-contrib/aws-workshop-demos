packer {
  required_plugins {
    amazon = {
      version = ">= 1.2.5"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

data "amazon-ami" "ubuntu-example" {
  filters = {
    name                = "ubuntu/images/*ubuntu*"
    root-device-type    = "ebs"
    virtualization-type = "hvm"
    architecture        = "x86_64"
  }
  most_recent = true
  owners      = ["amazon"]
  region      = "us-east-1"
}

source "amazon-ebs" "ubuntu-example" {
  ami_description = "Packer example in AWS"
  ami_name        = "kostis-demo"
  instance_type   = "t1.micro"
  region          = "us-east-1"
  source_ami      = "${data.amazon-ami.ubuntu-example.id}"
  ssh_username    = "ubuntu"
}

build {
  sources = ["source.amazon-ebs.ubuntu-example"]

  provisioner "file" {
    destination = "sample"
    source      = "sample"
  }

}
