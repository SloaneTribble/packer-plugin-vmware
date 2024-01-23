# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

packer {
  required_version = ">= 1.7.0"
  required_plugins {
    vmware = {
      version = ">= 1.0.7"
      source  = "github.com/hashicorp/vmware"
    }
    vagrant = {
    version = ">= 1.1.1"
    source = "github.com/hashicorp/vagrant"
    }
  }
}



build {
  sources = ["source.vmware-iso.debian"]

  provisioner "shell" {
    script = "scripts/build.sh"
  }

  post-processor "vagrant" {
   keep_input_artifact = true
   provider_override = "vmware"
}
 

}

