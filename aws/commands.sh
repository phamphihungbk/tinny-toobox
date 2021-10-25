#Copy file from local to ec2
scp -i  ~/.ssh/pemkey -r /path/loca usernam@ip:path/remote
#Terminate EC2 Instance by CLI
aws ec2 terminate-instances --instance-ids [...instance_id] --region [region]
