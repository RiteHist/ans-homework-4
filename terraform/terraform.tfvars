vm_params = [ {
    core_fraction = 20
    cores = 2
    disk_size = 10
    disk_type = "network-hdd"
    hostname = "ansible-deb"
    memory = 1
    name = "ansible-deb"
    nat = true
    platform_id = "standard-v4a"
    preemptible = true
    username = "ritehist"
    image_family = "ubuntu-2004-lts"
},
{
    core_fraction = 20
    cores = 2
    disk_size = 10
    disk_type = "network-hdd"
    hostname = "ansible-cent"
    memory = 1
    name = "ansible-cent"
    nat = true
    platform_id = "standard-v4a"
    preemptible = true
    username = "ritehist"
    image_family = "centos-stream-9-oslogin"    
} ]

vpc_params = [ {
    network_name = "test"
    subnet_name = "ansible"
    v4_cidr_blocks = [ "10.0.1.0/24" ]
} ]

replicas_num = {
  "clickhouse" = 1
  "vector" = 1
  "lighthouse" = 1
}