# General
variable "nsxt_host" {
  description = "The nsx-t host."
  type        = "string"
}

variable "nsxt_username" {
  description = "The nsx-t username."
  type        = "string"
}

variable "nsxt_password" {
  description = "The nsx-t password."
  type        = "string"
}

variable "allow_unverified_ssl" {
  default = false
  type    = "string"
}

variable "env_name" {
  description = "The name of the environment; used to tag resources and generate display names."
  type	      = "string"
}

variable "east_west_transport_zone_name" {
  description = "The name of the Transport Zone that carries internal traffic between the NSX-T components. Also known as the `overlay` transport zone."
  type        = "string"
}

variable "external_ip_pool_cidr" {
  description = "The CIDR for the External IP Pool"
  type        = "string"
}

variable "external_ip_pool_ranges" {
  description = "The IP Ranges for the External IP Pool"
  type        = "list"
}

variable "external_ip_pool_gateway" {
  description = "The gateway for the External IP Pool"
  type        = "string"
}

# Logical Routers + Switches {
variable "nsxt_edge_cluster_name" {
  description = "The name of the deployed Edge Cluster."
  type        = "string"
}

variable "nsxt_t0_router_name" {
  default     = "T0-Router"
  description = "The name of the T0 router."
  type        = "string"
}

# variable "nsxt_gateway_ip" {
#   description = "The IP Address of the gateway for egress traffic from the NSX-T routers."
#   type        = "string"
# }

variable "nat_gateway_ip" {
  description = "The IP Address of the SNAT rule for egress traffic from the Infra & Deployment subnets."
  type        = "string"
}

variable "om_ip" {
  description = "The public IP Address of the Operations Manager. The om's DNS (e.g. `om.system.tld`) should resolve to this IP"
  type        = "string"
}
# }

# Load Balancer {
variable "nsxt_lb_web_monitor_name" {
  default     = "pcf-web-monitor"
  description = "The name of the Active Health Monitor (healthcheck) for Web (HTTP(S)) traffic."
  type        = "string"
}

variable "nsxt_lb_tcp_monitor_name" {
  default     = "pcf-tcp-monitor"
  description = "The name of the Active Health Monitor (healthcheck) for TCP traffic."
  type        = "string"
}

variable "nsxt_lb_ssh_monitor_name" {
  default     = "pcf-ssh-monitor"
  description = "The name of the Active Health Monitor (healthcheck) for SSH traffic."
  type        = "string"
}

variable "nsxt_lb_web_server_pool_name" {
  default     = "pcf-web-pool"
  description = "The name of the Server Pool (collection of VMs which handle traffic) for Web (HTTP(S)) traffic."
  type        = "string"
}

variable "nsxt_lb_tcp_server_pool_name" {
  default     = "pcf-tcp-pool"
  description = "The name of the Server Pool (collection of VMs which handle traffic) for TCP traffic."
  type        = "string"
}

variable "nsxt_lb_ssh_server_pool_name" {
  default     = "pcf-ssh-pool"
  description = "The name of the Server Pool (collection of VMs which handle traffic) for SSH traffic."
  type        = "string"
}

variable "nsxt_lb_web_virtual_server_name" {
  default     = "pcf-web-vs"
  description = "The name of the Virtual Server for Web (HTTP(S)) traffic."
  type        = "string"
}

variable "nsxt_lb_web_virtual_server_ip_address" {
  description = "The ip address on which the Virtual Server listens for Web (HTTP(S)) traffic."
  type        = "string"
}

variable "nsxt_lb_web_virtual_server_ports" {
  default     = ["80", "443"]
  description = "The list of port(s) on which the Virtual Server listens for Web (HTTP(S)) traffic."
  type        = "list"
}

variable "nsxt_lb_tcp_virtual_server_name" {
  default     = "pcf-tcp-vs"
  description = "The name of the Virtual Server for TCP traffic."
  type        = "string"
}

variable "nsxt_lb_tcp_virtual_server_ip_address" {
  description = "The ip address on which the Virtual Server listens for TCP traffic."
  type        = "string"
}

variable "nsxt_lb_tcp_virtual_server_ports" {
  description = "The list of port(s) on which the Virtual Server listens for TCP traffic."
  type        = "list"
}

variable "nsxt_lb_ssh_virtual_server_name" {
  default     = "pcf-ssh-vs"
  description = "The name of the Virtual Server for SSH traffic."
  type        = "string"
}

variable "nsxt_lb_ssh_virtual_server_ip_address" {
  description = "The ip address on which the Virtual Server listens for SSH traffic."
  type        = "string"
}

variable "nsxt_lb_ssh_virtual_server_ports" {
  default     = ["2222"]
  description = "The list of port(s) on which the Virtual Server listens for SSH traffic."
  type        = "list"
}

variable "nsxt_lb_name" {
  default     = "pcf-lb"
  description = "The name of the Load Balancer itself."
  type        = "string"
}

variable "nsxt_lb_size" {
  default     = "MEDIUM"
  description = "The size of the Load Balancer. Accepted values: SMALL, MEDIUM, or LARGE"
  type        = "string"
}
# }
