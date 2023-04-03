
output "prometheus_addresses" {
  value = [for main in aws_instance.mtc_main : "http://${main.public_ip}:9090"]
}

output "grafana_addresses" {
  value = [for main in aws_instance.mtc_main : "http://${main.public_ip}:3000"]
}

output "jenkins_addresses" {
  value = [for main in aws_instance.mtc_main : "http://${main.public_ip}:8080"]
}

