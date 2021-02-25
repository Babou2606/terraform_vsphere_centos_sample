#Usage

Deploy multiple VMware VMs with Terraform only on VSphere - NOT For AWS -

#Pre Requistes

- Terraform
- A template with open-vm-tools and perl (very important... If not, network doesn't work and terraform crash)
- Not compulsory but wget, vim can save your life
- Change in main.tf the DC Name ("YOUR_DC") and information about IP, hostname, ...
- Change all variables in terraform.tfvars (important to connect to your VCENTER) 

