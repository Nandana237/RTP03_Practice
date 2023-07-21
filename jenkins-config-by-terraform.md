Configuring Jenkins-Master
---------------------------
1. Run Master and Slave by Terraform code "ec2_with_vpc_sg_variables_foreach_output"

2. Connect Jenkins-master

3. sudo su --> sudo yum install git -y

4. git clone https://github.com/Nandana237/valaxy-RTP-03.git

5. cd valaxy-RTP-03 

6. ls -l --> you will find jenkins-post-install.sh

7. chmod 755 jenkins-post-install.sh

8. ./jenkins-post-install.sh --> Docker and docker-compose will be installed

9. sudo chmod 777 /var/run/docker.sock

10. Check for docker images

11. Check for nginx.conf and docker-compose.yml

12. docker-compose up -d

13. Browse jenkins-master IP:4000

14. sudo cat /home/ec2-user/jenkins_compose/jenkins_configuration/secrets/initialAdminPassword
