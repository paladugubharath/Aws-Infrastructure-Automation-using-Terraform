module "vpc" {
  source = "./modules/vpc"
}

module "sg" {
  source = "./modules/sg"
  vpc_id = module.vpc.vpc_id
}

module "alb" {
  source     = "./modules/alb"
  subnet_ids = module.vpc.subnet_ids
  sg_id      = module.sg.sg_id
}

module "asg" {
  source        = "./modules/asg"
  ami_id        = var.ami_id
  key_name      = var.key_name
  subnet_ids    = module.vpc.subnet_ids
  sg_id         = module.sg.sg_id
  target_group  = module.alb.target_group_arn
}

module "rds" {
  source      = "./modules/rds"
  db_username = var.db_username
  db_password = var.db_password
}

module "s3" {
  source = "./modules/s3"
}

module "dynamodb" {
  source = "./modules/dynamodb"
}

module "iam" {
  source = "./modules/iam"
}

module "lambda" {
  source      = "./modules/lambda"
  lambda_role = module.iam.lambda_role_arn
}

module "cloudwatch" {
  source = "./modules/cloudwatch"
}

module "sns" {
  source    = "./modules/sns"
  sns_email = var.sns_email
}