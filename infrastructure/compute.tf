# Terraform Azure RM Compute Module
# https://registry.terraform.io/modules/Azure/compute/azurerm/3.14.0
module "linuxserver" {
  source  = "Azure/compute/azurerm"
  version = "3.14.0"

  resource_group_name           = data.azurerm_resource_group.west_eu.name
  vm_os_publisher               = "Canonical"
  vm_os_offer                   = "0001-com-ubuntu-server-focal"
  vm_os_sku                     = "20_04-lts-gen2"
  delete_os_disk_on_termination = true
  remote_port                   = "22"
  admin_username                = var.ssh_user
  ssh_key                       = "~/.ssh/azureuser_cloudmore.pub"
  public_ip_dns                 = ["grafana-cloudmore"]
  vnet_subnet_id                = module.production_network.vnet_subnets[0]
  custom_data                   = filebase64("provisioning.sh")
}


# Deliver application code into instance
resource "null_resource" "deploy_app" {

  provisioner "file" {
    source      = "../app"
    destination = "/tmp" # Todo copy to proper location (permission denied)
    connection {
      type        = "ssh"
      host        = module.linuxserver.public_ip_dns_name[0]
      user        = var.ssh_user
      private_key = file("~/.ssh/azureuser_cloudmore")
    }
  }
  depends_on = [module.linuxserver]
}


# TBD
resource "azurerm_network_security_rule" "http_access" {
  name                        = "http"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "80"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = data.azurerm_resource_group.west_eu.name
  network_security_group_name = module.linuxserver.network_security_group_name

  depends_on = [module.linuxserver]
}
