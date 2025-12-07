locals {
    ssh_pub_key = file(var.ssh_pub_path)
    vm_metadata_combined = merge(var.vm_metadata, {"user-data" = "${data.template_file.cloud-config.rendered}"})
}