module analytical_service_infra_vpc {
  source  = "dwp/vpc/aws"
  version = "2.0.7"

  common_tags                                = local.common_tags
  gateway_vpce_route_table_ids               = data.terraform_remote_state.analytical_service_infra.outputs.vpc.aws_route_table_private_ids
  interface_vpce_source_security_group_count = 0
  interface_vpce_source_security_group_ids   = []
  interface_vpce_subnet_ids                  = data.terraform_remote_state.analytical_service_infra.outputs.vpc.aws_subnets_private[*].id
  region                                     = var.vpc_region
  vpc_cidr_block                             = local.cidr_block[local.environment].emr-cluster-broker-vpc
  vpc_name                                   = local.name

  dynamodb_endpoint             = true
  ecrapi_endpoint               = false
  ecrdkr_endpoint               = true
  ec2_endpoint                  = true
  ec2messages_endpoint          = true
  glue_endpoint                 = true
  kms_endpoint                  = true
  logs_endpoint                 = true
  monitoring_endpoint           = true
  s3_endpoint                   = true
  emr_endpoint                  = true
  ssm_endpoint                  = false
  ssmmessages_endpoint          = false
  ecs_endpoint                  = true
  elasticloadbalancing_endpoint = true
}
