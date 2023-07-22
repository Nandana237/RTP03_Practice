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

Configuring Jenkins-Slave
---------------------------
1. Connect Jenkins-Slave server

2. sudo su

3. sudo yum install git -y

4. git clone https://github.com/Nandana237/valaxy-RTP-03.git

5. cd valaxy-RTP-03

6. Check for slave-setup.sh

7. sudo chmod 755 slave-setup.sh

8. ./slave-setup.sh  --> It will install Java, git, maven and docker

9. You can check java --version, docker --version, and mvn --version

Configuring Master-Slave system
-------------------------------
1. Go to jenkins --> Manage Jenkins --> Nodes and Clouds --> New Node --> Name (jenkins-slave) --> Permanent Agent --> Create

2. Name (jenkins-slave) --> description (jenkins-slave) --> Number of executors (5) --> Remote root directory (/home/ec2-user/jenkins)

3. Labels (java-slave) --> use this node as much as possible --> Launch agents via SSH --> Host (jenkins-slave IP Address)

4. Credentials (slave key.pem) --> Host Key Verification Strategy (Non verifying Verification Strategy) --> keep this agent online as much as possible

5. save --> launch --> you can see the msg (agent successfully connected and online)

Test Master and Slave connection
--------------------------------
1. Jenkins --> New Item --> test-job --> freestyle project --> OK

2. Restrict where this project can be run --> Label Expression (java-slave) --> Build steps (execute shell)
  
3. echo "This job is for testing master and slave connection >> /home/ec2-user/test.txt --> save --> build the job

4. login to jenkins-slave --> check for test.txt at /home/ec2-user/

5. cd jenkins --> You can find remoting, remoting.jar, and workspace

