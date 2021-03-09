variable "vpc_id" { type = string }
variable "subnets_ids" { type = list(string) }
variable "ssh_allowed_ips" { default = ["0.0.0.0/0"]  }
variable "ssh_create_key" { default = true }
variable "ssh_public_key" { default = null }
variable "ssh_key_name" { type = string }
variable "zookeeper_instance_number" { default = 1 }
variable "zookeeper_instance_size" { default = "t3.small" }
variable "zookeeper_hostnum_suffix" { default = 100 }
variable "zookeeper_properties_base64" { default = null }
variable "kafka_instance_number" { default = 1 }
variable "kafka_instance_size" { default = "t3.medium" }
variable "kafka_hostnum_suffix" { default = 110 }
variable "kafka_ebs_size_gb" { default = 5 }
variable "kafka_properties_base64" { default = null }
variable "kafka_install_webtool" { default = true }
variable "kafka_manager_password" { default = "kafkamanager" }
variable "kafka_webtool_intance_size" { default = "t3.small" }
variable "tags_shared" { type = map(string) }
