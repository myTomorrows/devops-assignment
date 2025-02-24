environment         = "prd"
desired_size        = 1
max_size            = 3
min_size            = 1
vpc_cidr            = "10.2.0.0/16"
public_subnet_cidrs = ["10.2.1.0/24", "10.2.2.0/24"]
availability_zones  = ["eu-west-1a", "eu-west-1b"]
app_version         = "0.1"
