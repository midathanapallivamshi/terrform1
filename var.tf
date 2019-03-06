//
// tags 
// this is going to be used for tagging purpose
//

variable "aws_region" {
  description = "AWS region to launch servers"
  default = "ap-south-1"
}

variable "aws_vpc" {
  description = "AWS VPC CIDR Block"
  default = "172.18.0.0/16"

}

variable "public_subnet_cidr1" {
    description = "CIDR for the Public Subnet"
    default = "172.18.1.0/24"
}

variable "public_subnet_cidr2" {
    description = "CIDR for the Public Subnet"
    default = "172.18.2.0/24"
}


variable "private_subnet_cidr1" {
    description = "CIDR for the Private Subnet"
    default = "172.18.3.0/24"
}

variable "private_subnet_cidr2" {
    description = "CIDR for the Private Subnet"
    default = "172.18.4.0/24"
}

variable "key_name" {
   description = "AWS key pair name"
   default = "mumbai"
}




/*
variable "vpc_public_subnets" { 
  type="list" 
  default = ["${var.public_subnet_cidr1}", "${var.public_subnet_cidr2}"] 
}



variable "security_groups" {
  default = ["sg-0c93b265"]
}


variable "db_remote_state_bucket" {
  description = "The name of the S3 bucket for the database's remote state"
  default = "amadeus/terraform.tfstate"
}

variable "db_remote_state_key" {
  description = "The path for the database's remote state in S3"
  default = "amadeus"
}

//
// route 53 zones 
variable "route53_zone" {
  default = "travel.staging"
}

variable "route53_zone_id" {
  default = "Z21CNLBMC2JK5Q"
}
// End of route 53
//

// subnets
// we devide the number of instances into two subnet groups 
// so we are configuring two subnets 
variable "subnet_1a" {
  description = "Private Subnet 1a"
  default = "subnet-54ad363d"
}

variable "subnet_1b" {
  description = "Private Subnet 1b"
  default = "subnet-dd05d790"
}

variable "subnets" {
  default = ["subnet-54ad363d","subnet-dd05d790"]
}

*/

