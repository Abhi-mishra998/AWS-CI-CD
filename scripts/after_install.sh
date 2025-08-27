#!/bin/bash
set -e

# Install & restart Apache (Ubuntu)
sudo apt update -y
sudo apt install -y apache2
sudo systemctl enable apache2
sudo systemctl restart apache2

# Copy website files (if needed)
sudo cp -r /home/ubuntu/my-webapp/index.html /var/www/html/

