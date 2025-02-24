environment         = "stg"
desired_size        = 1
max_size            = 3
min_size            = 1
vpc_cidr            = "10.1.0.0/16"
public_subnet_cidrs = ["10.1.1.0/24", "10.1.2.0/24"]
availability_zones  = ["eu-west-1a", "eu-west-1b"]
app_version         = "0.1"
