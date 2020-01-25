# NeoAirlines <br/>
Neo Airlines - Infrastructure as Code, CI/CD jenkins pipelines <br/>

**Steps:** 
<br/>

**1) Setup Jenkins - Infrastructure as code** <br/>

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
[root@server'ip~] docker run -d -p 8083:8083 -p 8086:8086 --restart=always --name influxdb -v /var/influx_data:/var/lib/influxdb influxdb <br/>
[root@server'ip~] docker run -d -p 3000:3000 --name grafana --restart=always --link influxdb:influxdb -e "GF_SECURITY_ADMIN_PASSWORD=P@ssw0rd" grafana/grafana <br/>
[root@server'ip~] curl -i -XPOST http://localhost:8086/query --data-urlencode "q=CREATE DATABASE \<databasename\>"
[root@server'ip~] curl -i -XPOST http://localhost:8086/query --data-urlencode "q=CREATE USER \<adminusername\> WITH PASSWORD '\<adminuserpwd\>' WITH ALL PRIVILEGES"

Adding mailhog just for testing for this project, we can setup separate mail server for enterprise application <br/>

**5) Add Jenkinsfile to code repo** <br/>

**6) Add influxDB plugin to Jenkins for grafana and configure**
 Configure with url, DBname, username and password
<br/>

**7) Add security group for port 3000,8086,8083 and Open browser server's-public-ip:3000**
Login with admin and P@ssword 
Import data source influxdb > configure ( url, database name, username, password)
Import Dashboard with ID 10557
You will be able to see dashboard with Jenkins data

**Done**

