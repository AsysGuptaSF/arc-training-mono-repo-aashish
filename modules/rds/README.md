<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.48.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.48.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.6.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_db_instance.arc_rds](https://registry.terraform.io/providers/hashicorp/aws/5.48.0/docs/resources/db_instance) | resource |
| [aws_db_parameter_group.rds_parameter_group](https://registry.terraform.io/providers/hashicorp/aws/5.48.0/docs/resources/db_parameter_group) | resource |
| [aws_db_subnet_group.rds_subnet_group](https://registry.terraform.io/providers/hashicorp/aws/5.48.0/docs/resources/db_subnet_group) | resource |
| [aws_security_group.rds_security_group](https://registry.terraform.io/providers/hashicorp/aws/5.48.0/docs/resources/security_group) | resource |
| [aws_ssm_parameter.db_password](https://registry.terraform.io/providers/hashicorp/aws/5.48.0/docs/resources/ssm_parameter) | resource |
| [random_password.db_password](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | n/a | `string` | `"us-east-1"` | no |
| <a name="input_db_allocated_storage"></a> [db\_allocated\_storage](#input\_db\_allocated\_storage) | The amount of storage (in GB) to be initially allocated for the database | `number` | `20` | no |
| <a name="input_db_engine"></a> [db\_engine](#input\_db\_engine) | The database engine type | `string` | `"postgres"` | no |
| <a name="input_db_engine_version"></a> [db\_engine\_version](#input\_db\_engine\_version) | The database engine version to use | `string` | `"16.3"` | no |
| <a name="input_db_identifier"></a> [db\_identifier](#input\_db\_identifier) | The identifier for the RDS instance | `string` | `"example"` | no |
| <a name="input_db_instance_class"></a> [db\_instance\_class](#input\_db\_instance\_class) | The RDS instance class | `string` | `"db.t2.micro"` | no |
| <a name="input_db_max_allocated_storage"></a> [db\_max\_allocated\_storage](#input\_db\_max\_allocated\_storage) | The upper limit to which Amazon RDS can automatically scale the storage of the DB instance. | `number` | `100` | no |
| <a name="input_db_name"></a> [db\_name](#input\_db\_name) | The name of the database | `string` | `"example"` | no |
| <a name="input_db_parameter_group_family"></a> [db\_parameter\_group\_family](#input\_db\_parameter\_group\_family) | The family of the DB parameter group | `string` | `null` | no |
| <a name="input_db_parameter_group_name"></a> [db\_parameter\_group\_name](#input\_db\_parameter\_group\_name) | The name of the DB parameter group | `string` | `"my-db-parameter-group"` | no |
| <a name="input_db_password_parameter_name"></a> [db\_password\_parameter\_name](#input\_db\_password\_parameter\_name) | The name of the SSM parameter that stores the database password | `string` | `null` | no |
| <a name="input_db_publicly_accessible"></a> [db\_publicly\_accessible](#input\_db\_publicly\_accessible) | Whether the RDS instance is publicly accessible | `bool` | `true` | no |
| <a name="input_db_storage_type"></a> [db\_storage\_type](#input\_db\_storage\_type) | The storage type to be associated with the RDS instance. Valid values are 'standard', 'gp2', or 'io1'. | `string` | `"gp2"` | no |
| <a name="input_db_subnet_group_name"></a> [db\_subnet\_group\_name](#input\_db\_subnet\_group\_name) | The name of the DB subnet group | `string` | `"my-db-subnet-group"` | no |
| <a name="input_db_username"></a> [db\_username](#input\_db\_username) | The master username for the database | `string` | n/a | yes |
| <a name="input_egress_rules"></a> [egress\_rules](#input\_egress\_rules) | A map of egress rules | <pre>map(object({<br>    description = string<br>    from_port   = number<br>    to_port     = number<br>    protocol    = string<br>    cidr_blocks = list(string)<br>  }))</pre> | <pre>{<br>  "all_traffic": {<br>    "cidr_blocks": [<br>      "0.0.0.0/0"<br>    ],<br>    "description": "All outbound traffic allowed",<br>    "from_port": 0,<br>    "protocol": "-1",<br>    "to_port": 0<br>  }<br>}</pre> | no |
| <a name="input_ingress_rules"></a> [ingress\_rules](#input\_ingress\_rules) | A map of ingress rules | <pre>map(object({<br>    description = string<br>    from_port   = number<br>    to_port     = number<br>    protocol    = string<br>    cidr_blocks = list(string)<br>  }))</pre> | <pre>{<br>  "ssh": {<br>    "cidr_blocks": [<br>      "0.0.0.0/0"<br>    ],<br>    "description": "SSH Port allowed for all",<br>    "from_port": 22,<br>    "protocol": "tcp",<br>    "to_port": 22<br>  }<br>}</pre> | no |
| <a name="input_security_group_description"></a> [security\_group\_description](#input\_security\_group\_description) | Description of the security group | `string` | `"Security group for the EC2 instance"` | no |
| <a name="input_security_group_name"></a> [security\_group\_name](#input\_security\_group\_name) | Name of the security group | `string` | `"instance_security_group"` | no |
| <a name="input_skip_final_snapshot"></a> [skip\_final\_snapshot](#input\_skip\_final\_snapshot) | Whether to skip the final DB snapshot during termination | `bool` | `true` | no |
| <a name="input_storage_encrypted"></a> [storage\_encrypted](#input\_storage\_encrypted) | Flag to determine whether the DB instance is encrypted. | `bool` | `false` | no |
| <a name="input_subnet_ids"></a> [subnet\_ids](#input\_subnet\_ids) | List of subnet IDs for the RDS instance | `list(string)` | n/a | yes |
| <a name="input_use_existing_parameter_group"></a> [use\_existing\_parameter\_group](#input\_use\_existing\_parameter\_group) | Flag to determine whether to use an existing parameter group | `bool` | `false` | no |
| <a name="input_use_existing_subnet_group"></a> [use\_existing\_subnet\_group](#input\_use\_existing\_subnet\_group) | Flag to determine whether to use an existing subnet group | `bool` | `false` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | ID of the VPC where the security group will be created | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_db_instance_arn"></a> [db\_instance\_arn](#output\_db\_instance\_arn) | The ARN of the RDS instance |
| <a name="output_db_instance_endpoint"></a> [db\_instance\_endpoint](#output\_db\_instance\_endpoint) | The connection endpoint for the RDS instance |
| <a name="output_db_instance_identifier"></a> [db\_instance\_identifier](#output\_db\_instance\_identifier) | The RDS instance identifier |
| <a name="output_db_instance_status"></a> [db\_instance\_status](#output\_db\_instance\_status) | The current status of the RDS instance |
| <a name="output_db_parameter_group_name"></a> [db\_parameter\_group\_name](#output\_db\_parameter\_group\_name) | The name of the DB parameter group |
| <a name="output_db_password_ssm_parameter"></a> [db\_password\_ssm\_parameter](#output\_db\_password\_ssm\_parameter) | The name of the SSM parameter that stores the database password |
| <a name="output_db_subnet_group_name"></a> [db\_subnet\_group\_name](#output\_db\_subnet\_group\_name) | The name of the DB subnet group |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->