#!/bin/bash

# Update package information
sudo apt-get update -y

# Install Nginx
sudo apt-get install nginx -y

# Start Nginx
sudo systemctl start nginx

# Enable Nginx to start automatically after reboot
sudo systemctl enable nginx

# Check Nginx status
sudo systemctl status nginx --no-pager

echo "Nginx installation completed successfully!"