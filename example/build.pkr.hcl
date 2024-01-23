# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

packer {
  required_version = ">= 1.7.0"
  required_plugins {
    vmware = {
      version = ">= 1.0.7"
      source  = "github.com/hashicorp/vmware"
    }
  }
}

build {
  sources = ["source.vmware-iso.debian"]

  provisioner "shell" {
    # move all this to a separate script
    inline = [
      # Upgrade debian
      "sudo apt-get update && sudo apt-get upgrade",

      # Create the .ssh directory if it doesn't exist
      # Username declared as "vagrant" in pkrvars -- access from variables file instead?
      "sudo mkdir .ssh",

      # Add the SSH public key to authorized_keys
      # use "tee -a" to append text as super user
      "echo \"${var.ssh_public_key}\" | sudo tee -a .ssh/authorized_keys",

      # Add vagrant insecure keys
      "echo \"${var.vagrant_pub_rsa}\" | sudo tee -a .ssh/authorized_keys",
      "echo \"${var.vagrant_pub_ed25519}\" | sudo tee -a .ssh/authorized_keys",

      # enable password-less Sudo
      "echo 'vagrant ALL=(ALL) NOPASSWD: ALL' | sudo tee -a /etc/sudoers",

      # update sources.list
      "echo 'deb http://deb.debian.org/debian bookworm main' | sudo tee -a /etc/apt/sources.list"
      "echo 'deb-src http://deb.debian.org/debian bookworm main' | sudo tee -a /etc/apt/sources.list"
      "echo 'deb http://deb.debian.org/debian-security/ bookworm-security main' | sudo tee -a /etc/apt/sources.list"
      "echo 'deb-src http://deb.debian.org/debian-security/ bookworm-security main' | sudo tee -a /etc/apt/sources.list"
      "echo 'deb http://deb.debian.org/debian bookworm-updates main' | sudo tee -a /etc/apt/sources.list"
      "echo 'deb-src http://deb.debian.org/debian bookworm-updates main' | sudo tee -a /etc/apt/sources.list"

      # install guest additions (quality of life features)
      "sudo apt-get upgrade",
      "sudo apt-get install -y open-vm-tools",
    ]
  }
}
