module "app-alb" {
  source = "./modules/application-load-balancer"

  region = "eu-west-1"
  alb-name = "infragurus-alb"
  internal = "false"
  alb-sg = "${module.infragurus-ec2-sg.ec2-sg-security-group}"
  alb-subnets = "${module.vpc.public-subnet-ids}"
  alb-tag = "infragurus-alb"
  certificate-arn = "arn:aws:acm:eu-west-1:898668804275:certificate/77cf630b-2e42-421a-96c9-049f1b7ea440"
  target-group-arn = "arn:aws:elasticloadbalancing:eu-west-1:898668804275:targetgroup/infragurus-tg/bbc376dff9e0dd2f"
}