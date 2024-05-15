<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | 5.48.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.48.0 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | 4.0.5 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ebs_volume.additional_volumes](https://registry.terraform.io/providers/hashicorp/aws/5.48.0/docs/resources/ebs_volume) | resource |
| [aws_instance.virtual_machine](https://registry.terraform.io/providers/hashicorp/aws/5.48.0/docs/resources/instance) | resource |
| [aws_key_pair.generated_key](https://registry.terraform.io/providers/hashicorp/aws/5.48.0/docs/resources/key_pair) | resource |
| [aws_security_group.instance_security_group](https://registry.terraform.io/providers/hashicorp/aws/5.48.0/docs/resources/security_group) | resource |
| [aws_volume_attachment.additional_volumes](https://registry.terraform.io/providers/hashicorp/aws/5.48.0/docs/resources/volume_attachment) | resource |
| [tls_private_key.ssh_key_generate](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_additional_volumes"></a> [additional\_volumes](#input\_additional\_volumes) | A list of additional volumes to attach to the instance | <pre>list(object({<br>    device_name = string<br>    volume_type = string<br>    volume_size = number<br>    encrypted   = bool<br>  }))</pre> | `[]` | no |
| <a name="input_ami"></a> [ami](#input\_ami) | The AMI to run on the instance. | `string` | `null` | no |
| <a name="input_auto_assign_public_ip_enabled"></a> [auto\_assign\_public\_ip\_enabled](#input\_auto\_assign\_public\_ip\_enabled) | Whether a public IP address is automatically assigned to the primary network interface of the instance in a VPC. | `bool` | `null` | no |
| <a name="input_availability_zone"></a> [availability\_zone](#input\_availability\_zone) | AZ (Availability Zone) to create the instance in. | `string` | `null` | no |
| <a name="input_aws_region"></a> [aws\_region](#input\_aws\_region) | n/a | `string` | `"us-east-1"` | no |
| <a name="input_delete_on_termination"></a> [delete\_on\_termination](#input\_delete\_on\_termination) | Whether the volume should be deleted when the instance is terminated | `bool` | `true` | no |
| <a name="input_encrypted"></a> [encrypted](#input\_encrypted) | Whether the volume should be encrypted | `bool` | `true` | no |
| <a name="input_instance_type"></a> [instance\_type](#input\_instance\_type) | The instance type to use for the instance. Updates to this field will trigger a stop/start of the EC2 instance. | `string` | `null` | no |
| <a name="input_security_group_description"></a> [security\_group\_description](#input\_security\_group\_description) | Description of the security group | `string` | `"Security group for the EC2 instance"` | no |
| <a name="input_security_group_name"></a> [security\_group\_name](#input\_security\_group\_name) | Name of the security group | `string` | `"instance_security_group"` | no |
| <a name="input_ssh_key"></a> [ssh\_key](#input\_ssh\_key) | The name of the SSH Key that should be used to access the instance. | `string` | `null` | no |
| <a name="input_subnet_id"></a> [subnet\_id](#input\_subnet\_id) | The ID of subnet in which to launch the instance. | `string` | `null` | no |
| <a name="input_volume_size"></a> [volume\_size](#input\_volume\_size) | The size of the volume in GB | `number` | `30` | no |
| <a name="input_volume_type"></a> [volume\_type](#input\_volume\_type) | The type of the volume | `string` | `"gp3"` | no |
| <a name="input_vpc_id"></a> [vpc\_id](#input\_vpc\_id) | ID of the VPC where the security group will be created | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ebs_volumes"></a> [ebs\_volumes](#output\_ebs\_volumes) | Information about the created EBS volumes |
| <a name="output_instance_id"></a> [instance\_id](#output\_instance\_id) | The ID of the created EC2 instance |
| <a name="output_private_key_location"></a> [private\_key\_location](#output\_private\_key\_location) | The location where the private key is saved |
| <a name="output_security_group_id"></a> [security\_group\_id](#output\_security\_group\_id) | The ID of the created security group |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->