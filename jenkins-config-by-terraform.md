Run Master and Slave by Terraform code "ec2_with_vpc_sg_variables_foreach_output"
Connect Jenkins-master
sudo su --> sudo yum install git -y
git clone https://github.com/Nandana237/valaxy-RTP-03.git
cd valaxy-RTP-03 
ls -l --> you will find jenkins-post-install.sh
chmod 755 jenkins-post-install.sh
./jenkins-post-install.sh --> Docker and docker-compose will be installed
sudo chmod 777 /var/run/docker.sock
Check for docker images
check for nginx.conf and docker-compose.yml
docker-compose up -d
browse jenkins-master IP:4000
sudo cat /home/ec2-user/jenkins_compose/jenkins_configuration/secrets/initialAdminPassword
