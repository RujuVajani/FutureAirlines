# NeoAirlines
Neo Airlines - Infrastructure as Code, CI/CD jenkins pipelines

**Steps:**

**1) Setup Jenkins - Infrastructure as code **

Use below command to create stack for jenkins 

aws cloudformation create-stack --stack-name myteststack --template-body file:///home/FutureAirlines/AutoScalingMultiAZWithNotifications.json --parameters ParameterKey=Parm1,ParameterValue=test1 ParameterKey=Parm2,ParameterValue=test2

OR go to AWS console > cloudformation > create stack and enter all values manually

**2) Add Admin password and create admin user**

For reference
<Load balancer url>/password.txt 
  

**3) SSH to server and install maven and docker for this project**
ssh -i key ec2-user<server's-public-ip>
[ec2-user@server'ip~] sudo su -
[root@server'ip~] yum install -y maven 
[root@server'ip~] yum install -y docker
[root@server'ip~] curl -sSL https://get.docker.com/ | sh
[root@server'ip~] service docker start
[root@server'ip~] docker run -d --restart unless-stopped --name mailhog -p 8025:8025 -p 1025:1025 mailhog/mailhog
[root@server'ip~] docker run -d --name=grafana -p 3000:3000 grafana/grafana

Adding mailhog just for testing for this project, we can setup separate mail server for enterprise application

**5) Add Jenkinsfile to code repo**

**6) Add influxDB plugin to Jenkins for grafana and configure

**7) Open browser server's-public-ip:3000


