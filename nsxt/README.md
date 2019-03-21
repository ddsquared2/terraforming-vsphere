Pre-requisites:
* NSX-T Manager deployed
* NSX-T Edge Cluster deployed
* Transport Zones created

on fait `terraform init`

-------- Old stuff -----------
== Deploying an standalone NSX-T network for future manual opsman OVA deploys ==

1. Provision a T0 router for your environment. At the moment, we do not support multiple environments on one T0 router as their NAT rules will conflict.

1. Fill in terraform.tfvars in this directory as appropriate.

1. Use terraform to deploy your NSX-T network resources:
   ```
   pushd nsxt
   terraform apply
   ```

1. If you log in to your vCenter console, you should be able to find the opaque networks you just created under the Navigator's "Networking" tab.

1. Follow [the pcf docs](https://docs.pivotal.io/pivotalcf/2-1/customizing/deploying-vm.html)
   to upload an opsman OVA. When it prompts you for a network, do not select any NSX-T logical switch, including the ones you've just created.
   Instead, you should select any available distributed port group. This is a workaround for a known bug in the vCenter console's upload dialogues.
   When prompted for an IP address, use 10.0.1.10.
   When you reach the step to select "Power on after deployment," skip it and hit finish.

1. After your OVA is done uploading, select it in the vCenter navigator, then click "Actions -> Edit Settings".
   Select the opaque network returned by `terraform output`, then power on your VM.

1. Set up a DNS entry for `terraform output om_ipv4_address`, then log in to your opsman at that domain.

1. Follow along with the PCF documentation to [deploy a bosh director](https://docs.pivotal.io/pivotalcf/2-1/customizing/vsphere-config.html), but with the following extra changes:
  1. Under vCenter Config, enable NSX networking, NSX-T Mode, and supply your nsx-t address, username, and password from terraform.tfvars.
  1. When prompted to enter networks, use the subnets and gateways from `terraform output`. BOSH must be deployed into the infrastructure subnet and PAS into the deployment subnet for routing to work.
  1. `10.0.1.1-10.0.1.10` should be reserved in the infrastructure subnet, but only `10.0.2.1` need be reserved in the PAS deployment subnet.

1. Follow along with the PCF documentation to [deploy PAS](https://docs.pivotal.io/pivotalcf/2-1/customizing/config-er-vmware.html), but also do the following:
  1. Under Networking, supply `10.0.2.2` as the HAProxy IP, as we rely on it to simplify NAT for the CF routing layer.
