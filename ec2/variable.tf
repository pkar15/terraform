variable "ami" {
  default = "ami-01216e7612243e0ef"
}

variable "tags" {
  type = map(string)
  default = {
    "Name" = "EC2_TF"
    "Env"  = "Demo"
  }
}

variable "subnet" {
  type = string
  default = "subnet-0fcb85aabadfb4ac5"
  }

variable "vpc" {
  type    = string
  default = "vpc-02702e24a8be8ad92"

}

variable "sg_ingress_rules" {
  type        = map(object(
      {
        from = number
        to = number
        proto = string
        cidr = list(string)
        desc = string
      }
    ))
  default = {
    thing1 = { from = 22, to = 22, proto = "tcp", cidr = ["0.0.0.0/0"], desc = "test"},
    thing2 = { from = 443, to = 443, proto = "tcp", cidr = ["0.0.0.0/0"], desc = "test"},
    thing3 = { from = 80, to = 80, proto = "tcp", cidr = ["0.0.0.0/0"], desc = "test"}
    }
  }
variable "sg_egress_rules" {
  type        = map(object(
      {
        from = number
        to = number
        proto = string
        cidr = list(string)
        desc = string
      }
    ))
  default = {
    thing1 = { from = 0, to = 0, proto = "-1", cidr = ["0.0.0.0/0"], desc = "test"}
    }
  }