provider "aws" {
  region = "ap-northeast-2"
}

module "vpc" {
  source      = "../../module/vpc"
  name        = var.project
  cidr_block  = "10.30.0.0/16"
}

module "bastion" {
  source        = "../../module/ec2"
  name          = "${var.project}-bastion"
  ami_id           = "ami-0c9c942bd7bf113a2"
  instance_type = "t2.micro"
  subnet_id     = module.vpc.public_subnet_ids[0] # ⚠️ 주의: 이 출력이 실제로 있어야 함
}

output "bastion_ip" {
  value = module.bastion.public_ip
}

