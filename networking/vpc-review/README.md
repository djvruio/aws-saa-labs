# Interesting links
[VPC Masterclass freecodecamp](https://www.youtube.com/watch?v=g2JOHLHh4rI)
[AWS Client VPN](https://www.youtube.com/watch?v=St8y0xZSn3c)
[AWS VPN Site to Site](https://www.youtube.com/watch?v=7tTrN8WXMlg)
[IPV4 Subnet creator](https://network00.com/NetworkTools/IPv4SubnetCreator/)
[NAT Instance](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_NAT_Instance.html)
[AWS Workshops](https://workshops.aws)
[Another AWS Workshops](https://awsworkshop.io/)


# Launch instance in Public Subnet
aws ec2 run-instances --image-id <value> --instance-type <value> --security-group-ids <value> --subnet-id <value> --key-name <value> --user-data file://user-data-subnet-id.txt



# Launch instance in Public 1A
aws ec2 run-instances --image-id ami-0022f774911c1d690 --instance-type t2.micro --security-group-ids sg-06f7f75b02362d976 --subnet-id subnet-072c56154588692f1 --key-name KeyPairForEC2TestingInstancesVirginia --user-data file://user-data-subnet-id.txt --profile administrator

aws ec2 run-instances --image-id ami-0022f774911c1d690 --instance-type t2.micro --security-group-ids sg-06f7f75b02362d976 --subnet-id subnet-072c56154588692f1 --key-name KeyPairForEC2TestingInstancesVirginia --user-data file://user-data-subnet-id.txt --profile administrator

# Launch instance in Private 1B
Without NAT Gateway
aws ec2 run-instances --image-id ami-0022f774911c1d690 --instance-type t2.micro --security-group-ids sg-06f7f75b02362d976 --subnet-id subnet-0a3a2406f95147e66 --key-name KeyPairForEC2TestingInstancesVirginia --user-data file://user-data-subnet-id.txt --profile administrator

With a NAT gateway in a public subnet and adding  route on Private Route Table subnet
aws ec2 run-instances --image-id ami-0022f774911c1d690 --instance-type t2.micro --security-group-ids sg-06f7f75b02362d976 --subnet-id subnet-0a3a2406f95147e66 --key-name KeyPairForEC2TestingInstancesVirginia --user-data file://user-data-subnet-id.txt --profile administrator

# Terminate instances

aws ec2 terminate-instances --instance-ids <value> <value>