# NeoAirlines <br/>
Neo Airlines - Infrastructure as Code, CI/CD jenkins pipelines <br/>

**Steps:** <br/>

**1) Setup Jenkins - Infrastructure as code ** <br/>

Use below command to create stack for jenkins  <br/>

aws cloudformation create-stack --stack-name myteststack --template-body file:///home/FutureAirlines/AutoScalingMultiAZWithNotifications.json --parameters ParameterKey=Parm1,ParameterValue=test1 ParameterKey=Parm2,ParameterValue=test2

OR go to AWS console > cloudformation > create stack and enter all values manually <br/>

**2) Add Admin password and create admin user** <br/>

For reference <br/>
<Load balancer url>/password.txt  <br/>
  

**3) SSH to server and install maven and docker for this project**
ssh -i key ec2-user<server's-public-ip> <br/>
[ec2-user@server'ip~] sudo su - <br/>
[root@server'ip~] yum install -y maven  <br/>
[root@server'ip~] yum install -y docker <br/>
[root@server'ip~] curl -sSL https://get.docker.com/ | sh <br/>
[root@server'ip~] service docker start <br/>
[root@server'ip~] docker run -d --restart unless-stopped --name mailhog -p 8025:8025 -p 1025:1025 mailhog/mailhog <br/>
[root@server'ip~] docker run -d --name=grafana -p 3000:3000 grafana/grafana <br/>

Adding mailhog just for testing for this project, we can setup separate mail server for enterprise application <br/>

**5) Add Jenkinsfile to code repo** <br/>

**6) Add influxDB plugin to Jenkins for grafana and configure** <br/>

**7) Open browser server's-public-ip:3000


