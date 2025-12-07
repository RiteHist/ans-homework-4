resource "local_file" "hosts_template" {
    content = templatefile("${path.module}/../playbook/inventory/hosts.yml.tpl", {
        clickhouse-vms = module.test-vm-clickhouse.vm-network
        vector-vms = module.test-vm-vector.vm-network
        lighthouse-vms = module.test-vm-lighthouse.vm-network
    })
    filename = "${path.module}/../playbook/inventory/hosts.yml"
}