data "yandex_compute_image" "image" {
    family = var.vm_params[0].image_family
}

data "yandex_compute_image" "image-cent" {
    family = var.vm_params[1].image_family
}

module "test-vm-vector" {
    source = "git::https://github.com/RiteHist/terraform-vm-module.git?ref=main"
    core_fraction = var.vm_params[0].core_fraction
    cores = var.vm_params[0].cores
    disk_size = var.vm_params[0].disk_size
    disk_type = var.vm_params[0].disk_type
    hostname = "${var.vm_params[0].hostname}-${var.vm_roles[1]}"
    image_id = data.yandex_compute_image.image.id
    memory = var.vm_params[0].memory
    name = "${var.vm_params[0].name}-${var.vm_roles[1]}"
    nat = var.vm_params[0].nat
    platform_id = var.vm_params[0].platform_id
    preemptible = var.vm_params[0].preemptible
    replicas = var.replicas_num[var.vm_roles[1]]
    subnet_id = yandex_vpc_subnet.test.id
    metadata = local.vm_metadata_combined
}

module "test-vm-clickhouse" {
    source = "git::https://github.com/RiteHist/terraform-vm-module.git?ref=main"
    core_fraction = var.vm_params[1].core_fraction
    cores = var.vm_params[1].cores
    disk_size = var.vm_params[1].disk_size
    disk_type = var.vm_params[1].disk_type
    hostname = "${var.vm_params[1].hostname}-${var.vm_roles[0]}"
    image_id = data.yandex_compute_image.image-cent.id
    memory = var.vm_params[1].memory
    name = "${var.vm_params[1].name}-${var.vm_roles[0]}"
    nat = var.vm_params[1].nat
    platform_id = var.vm_params[1].platform_id
    preemptible = var.vm_params[1].preemptible
    replicas = var.replicas_num[var.vm_roles[0]]
    subnet_id = yandex_vpc_subnet.test.id
    metadata = local.vm_metadata_combined
}

module "test-vm-lighthouse" {
    source = "git::https://github.com/RiteHist/terraform-vm-module.git?ref=main"
    core_fraction = var.vm_params[0].core_fraction
    cores = var.vm_params[0].cores
    disk_size = var.vm_params[0].disk_size
    disk_type = var.vm_params[0].disk_type
    hostname = "${var.vm_params[0].hostname}-${var.vm_roles[2]}"
    image_id = data.yandex_compute_image.image.id
    memory = var.vm_params[0].memory
    name = "${var.vm_params[0].name}-${var.vm_roles[2]}"
    nat = var.vm_params[0].nat
    platform_id = var.vm_params[0].platform_id
    preemptible = var.vm_params[0].preemptible
    replicas = var.replicas_num[var.vm_roles[2]]
    subnet_id = yandex_vpc_subnet.test.id
    metadata = local.vm_metadata_combined
}

data "template_file" "cloud-config" {
    template = file("${path.module}/cloud-init.yml")
    vars = {
        vm_username = var.vm_params[0].username
        ssh_pub_keys = local.ssh_pub_key
    }
}