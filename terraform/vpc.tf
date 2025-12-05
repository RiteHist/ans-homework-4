resource "yandex_vpc_network" "test" {
    name = var.vpc_params[0].network_name
}

resource "yandex_vpc_subnet" "test" {
    name = var.vpc_params[0].subnet_name
    zone = var.default_zone
    network_id = yandex_vpc_network.test.id
    v4_cidr_blocks = var.vpc_params[0].v4_cidr_blocks
}