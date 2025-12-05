---
clickhouse:
  hosts:
    %{~ for host in clickhouse-vms ~}
    ${host.name}:
      ansible_host: ${host.public_ip}
    %{~ endfor ~}
vector:
  hosts:
    %{~ for host in vector-vms ~}
    ${host.name}:
      ansible_host: ${host.public_ip}
    %{~ endfor ~}
lighthouse:
  hosts:
    %{~ for host in lighthouse-vms ~}
    ${host.name}:
      ansible_host: ${host.public_ip}
    %{~ endfor ~}
