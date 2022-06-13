#!/bin/bash
sudo yum install httpd php php-mysql mysql -y
cd /var/www/html
sudo wget https://wordpress.org/wordpress-5.1.1.tar.gz
sudo tar -xzf wordpress-5.1.1.tar.gz
sudo cp -r wordpress/* /var/www/html/
sudo rm -rf wordpress
sudo rm -rf wordpress-5.1.1.tar.gz
sudo chmod -R 755 wp-content
sudo chown -R apache:apache wp-content
sudo systemctl start httpd
sudo systemctl enable httpd
sudo systemctl is-enabled httpd