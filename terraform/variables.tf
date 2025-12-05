variable "default_zone" {
    type = string
    default = "ru-central1-a"
}

variable "cloud_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/cloud/get-id"
}

variable "folder_id" {
  type        = string
  description = "https://cloud.yandex.ru/docs/resource-manager/operations/folder/get-id"
}

variable "vm_params" {
    type = list(object(
        {
            core_fraction = number
            cores = number
            disk_size = number
            disk_type = string
            hostname = string
            memory = number
            name = string
            nat = bool
            platform_id = string
            preemptible = bool
            username = string
            image_family = string
        }
    ))
}

variable "ssh_pub_path" {
    type = string
    default = "~/.ssh/id_ed25519.pub"
}

variable "vpc_params" {
    type = list(object(
        {
            network_name = string
            subnet_name = string
            v4_cidr_blocks = list(string)
        }
    ))
}

variable "vm_metadata" {
    type = map(string)
    default = { "serial-port-enable" = "1"}
}

variable "vm_roles" {
    type = list(string)
    default = ["clickhouse", "vector", "lighthouse"]
}

variable "replicas_num" {
    type = map(number)
}