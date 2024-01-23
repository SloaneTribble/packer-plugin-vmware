# provision.sh

# Upgrade debian
sudo apt-get update && sudo apt-get upgrade

# Create the .ssh directory if it doesn't exist
sudo mkdir .ssh

# Add the SSH public key to authorized_keys
echo "${var.ssh_public_key}" | sudo tee -a .ssh/authorized_keys

# Add vagrant insecure keys
echo "${var.vagrant_pub_rsa}" | sudo tee -a .ssh/authorized_keys
echo "${var.vagrant_pub_ed25519}" | sudo tee -a .ssh/authorized_keys
sudo chmod 700 .ssh

# disable DNS lookup of clients connecting to the server, which speeds up SSH connection
echo 'UseDNS no' | sudo tee -a /etc/ssh/sshd_config

# enable password-less Sudo
echo 'vagrant ALL=(ALL) NOPASSWD: ALL' | sudo tee -a /etc/sudoers

# update sources.list
echo 'deb http://deb.debian.org/debian bookworm main' | sudo tee -a /etc/apt/sources.list
echo 'deb-src http://deb.debian.org/debian bookworm main' | sudo tee -a /etc/apt/sources.list
echo 'deb http://deb.debian.org/debian-security/ bookworm-security main' | sudo tee -a /etc/apt/sources.list
echo 'deb-src http://deb.debian.org/debian-security/ bookworm-security main' | sudo tee -a /etc/apt/sources.list
echo 'deb http://deb.debian.org/debian bookworm-updates main' | sudo tee -a /etc/apt/sources.list
echo 'deb-src http://deb.debian.org/debian bookworm-updates main' | sudo tee -a /etc/apt/sources.list

# install guest additions (quality of life features?)
# build cache
sudo apt-get update -y

# upgrade using cache
sudo apt-get upgrade -y
sudo DEBIAN_FRONTEND=noninteractive apt-get install open-vm-tools -y
