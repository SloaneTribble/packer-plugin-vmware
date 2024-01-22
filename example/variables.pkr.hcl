# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "boot_command" {
  type    = list(string)
  default = ["<esc><wait>", "<esc><wait>", "<enter><wait>", "/install/vmlinuz<wait>", " initrd=/install/initrd.gz", " auto-install/enable=true", " debconf/priority=critical", " preseed/url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/preseed.cfg<wait>", " -- <wait>", "<enter><wait>"]
}

variable "build_username" {
  type    = string
  default = "vagrant"
}

variable "build_password" {
  type    = string
  default = "vagrant"
}

variable "cdrom_adapter_type" {
  type    = string
  default = "sata"
}

variable "data_directory" {
  type    = string
  default = "null"
}

variable "disk_size" {
  type    = number
  default = 65536
}

variable "disk_adapter_type" {
  type    = string
  default = "lsilogic"
}

variable "guest_os_type" {
  type    = string
  default = null
}

variable "hardware_version" {
  type    = number
  default = 19 # Refer to VMware versions https://kb.vmware.com/s/article/1003746
}

variable "iso_checksum" {
  type    = string
  default = null
}

variable "iso_url" {
  type    = string
  default = null
}

variable "memory" {
  type    = number
  default = null
}

variable "network_adapter_type" {
  type    = string
  default = null
}

variable "tools_upload_flavor" {
  type    = string
  default = null
}

variable "tools_upload_path" {
  type    = string
  default = null
}

variable "vm_name" {
  type    = string
  default = "debian"
}

variable "vmx_data" {
  type = map(string)
  default = {
    "cpuid.coresPerSocket" = "2"
  }
}

variable "vm_guest_os_language" {
  type    = string
  default = "en"
}

variable "vm_guest_os_keyboard" {
  type    = string
  default = "us"
}

variable "vm_guest_os_timezone" {
  type    = string
  default = "UTC"
}

variable "vm_headless" {
  type    = bool
  default = true
}

variable "ssh_public_key" {
  type = string
  default = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAID3eJ5tPwQJdJJum82Q9EP7hF2S0wVCrptTV6p5Fh7R7 sloanetribble@admins-MacBook-Pro.local"
}

variable "vagrant_pub_rsa"{
  type = string
  default = "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA6NF8iallvQVp22WDkTkyrtvp9eWW6A8YVr+kz4TjGYe7gHzIw+niNltGEFHzD8+v1I2YJ6oXevct1YeS0o9HZyN1Q9qgCgzUFtdOKLv6IedplqoPkcmF0aYet2PkEDo3MlTBckFXPITAMzF8dJSIFo9D8HfdOV0IAdx4O7PtixWKn5y2hMNG0zQPyUecp4pzC6kivAIhyfHilFR61RGL+GPXQ2MWZWFYbAGjyiYJnAmCP3NOTd0jMZEnDkbUvxhMmBYSdETk1rRgm+R4LOzFUGaHqHDLKLX+FIPKcF96hrucXzcWyLbIbEgE98OHlnVYCzRdK8jlqm8tehUc9c9WhQ== vagrant insecure public key"
}

variable "vagrant_pub_ed25519" {
  type = string
  default = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIN1YdxBpNlzxDqfJyw/QKow1F+wvG9hXGoqiysfJOn5Y vagrant insecure public key"
}