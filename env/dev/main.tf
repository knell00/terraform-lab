provider "aws" { region = "ap-northeast-2" }

locals { azs = ["ap-northeast-2a","ap-northeast-2c"] }

module "vpc" {
    source              = "../../module/vpc"
      name_prefix         = var.project
        cidr                = "10.30.0.0/16"
          azs                 = local.azs
            public_subnet_bits  = 8
          }

          module "bastion" {
              source         = "../../module/ec2"
                name           = "${var.project}-bastion"
                  ami            = "ami-0c9c942bd7bf113a2"
                    instance_type  = "t2.micro"
                      subnet_id      = module.vpc.public_subnet_ids[0]
                    }

                    output "bastion_ip" { value = module.bastion.public_ip }
