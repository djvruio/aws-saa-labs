#! /bin/bash

# Install a Web Server
sudo yum update
sudo yum install -y httpd
sudo systemctl start httpd
sudo systemctl enable httpd

# Create a main html page
echo `sudo systemctl is-enabled httpd` | sudo tee /var/www/html/index.html
echo "<h1>Deployed Instance via Terraform</h1>" | sudo tee -a /var/www/html/index.html
# Install Ruby
sudo yum install -y ruby
# Install AMI Tools
sudo yum install -y ec2-ami-tools
export RUBYLIB=$RUBYLIB:/usr/lib/ruby/site_ruby:/usr/lib64/ruby/site_ruby
echo `ec2-ami-tools-version` | sudo tee -a /var/www/html/index.html
#URL_AMI_TOOLS="https://s3.amazonaws.com/ec2-downloads/ec2-ami-tools.noarch.rpm"
#WGET_OPTS='--wait=5'
#wget $WGET_OPTS $URL_AMI_TOOLS
#curl -O https://s3.amazonaws.com/ec2-downloads/ec2-ami-tools.noarch.rpm
#sleep 2
#HASH_OK=$(rpm -K ec2-ami-tools.noarch.rpm)
#echo "${HASH_OK}"
#if [[ $HASH_OK == *"md5 OK"* ]]; then
#  sudo yum install -y ec2-ami-tools.noarch.rpm
#  EC2_AMI_TOOLS_VERSION=$(rpm -qil ec2-ami-tools | grep ec2/amitools/version)
#  echo "${EC2_AMI_TOOLS_VERSION}"
#  export RUBYLIB=$RUBYLIB:/usr/lib/ruby/site_ruby:/usr/lib64/ruby/site_ruby
#  echo `ec2-ami-tools-version`
#fi

#sudo yum install -y aws-amitools-ec2 && export PATH=$PATH:/opt/aws/bin > /etc/profile.d/aws-amitools-ec2.sh && . /etc/profile.d/aws-amitools-ec2.sh

# Manage signing certificates
# 1. create private key
# openssl genrsa 2048 > private-djvr-key.pem
# 2. Generate certificate
# https://www.shellhacks.com/create-csr-openssl-without-prompt-non-interactive/
# openssl req -new -x509 -nodes -sha256 -days 365 -key private-djvr-key.pem -outform PEM -out certificate-djvr.pem -subj "/C=EC/ST=PICHINCHA/L=QUITO/O=CAMPUSOFT CIA LTDA/OU=IT DEPARTMENT/CN=example.com"
# 3. Load certificate
# aws iam upload-signing-certificate --user-name Administrator --certificate-body certificate-djvr.pem --private-key private-djvr-key.pem
# aws iam upload-server-certificate --private-key file://iflb-no-path-phrase-key.pem
# https://docs.aws.amazon.com/elasticbeanstalk/latest/dg/configuring-https-ssl.html
# openssl genrsa 2048 > privatekey.pem
# openssl req -new -key privatekey.pem -out csr.pem -subj "/C=EC/ST=PICHINCHA/L=QUITO/O=CAMPUSOFT CIA LTDA/OU=IT DEPARTMENT/CN=ec2-3-84-2-151.compute-1.amazonaws.com"
# openssl x509 -req -days 365 -in csr.pem -signkey privatekey.pem -out public.crt
# Upload certificate
# aws iam upload-server-certificate  --user-name Administrator --certificate-body public.crt --private-key private-key.pem
# aws iam upload-signing-certificate --user-name Administrator --certificate-body public.crt --private-key private-djvr-key.pem
# aws iam upload-server-certificate --server-certificate-name LinuxInstanceForAMI --certificate-body public.crt --private-key private-key.pem
# aws sts get-session-token --duration-seconds 900 --serial-number "869793048589451" --token-code 123456
# aws iam list-mfa-devices --user-name Administrator