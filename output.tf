output "external_ip_address_node1" {
  value = ah_cloud_server.example.*.ips.0.ip_address
}

output "external_ip_address_node2" {
  value = ah_cloud_server.example.*.ips.1.ip_address
}

output "external_ip_address_db" {
  value = ah_cloud_server.example.*.ips.2.ip_address
}