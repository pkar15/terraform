resource "aws_security_group" "tf_SG" {
  name        = "Tf_SG"
  description = "SG created by Terraform"
  vpc_id      = var.vpc
  tags = {
    "Name" = "SG-1"
    "Managed By" = "Terraform"
  }
}

resource "aws_security_group_rule" "ingress_rules" {
  for_each    = var.sg_ingress_rules
  type        = "ingress"
  from_port   = each.value.from
  to_port     = each.value.to
  cidr_blocks = each.value.cidr
  protocol    = each.value.proto
  description = each.value.desc
  security_group_id = aws_security_group.tf_SG.id
}

resource "aws_security_group_rule" "egress_rules" {
  for_each    = var.sg_egress_rules
  type        = "egress"
  from_port   = each.value.from
  to_port     = each.value.to
  cidr_blocks = each.value.cidr
  protocol    = each.value.proto
  description = each.value.desc
  security_group_id = aws_security_group.tf_SG.id
}