#!/bin/bash

# Update the package list
sudo apt update

# Install Go
sudo apt install -y golang-go

# Verify the installation
go version

# Set up the workspace
mkdir -p ~/go/{bin,src,pkg}

# Configure environment variables
echo 'export GOPATH=$HOME/go' >> ~/.bashrc
echo 'export PATH=$PATH:$GOPATH/bin' >> ~/.bashrc

# Apply the changes
source ~/.bashrc

# Verify Go installation
go version

echo "Go has been successfully installed and configured on your Ubuntu system!"