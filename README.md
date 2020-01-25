# NeoAirlines
Neo Airlines - Infrastructure as Code, CI/CD jenkins pipelines


Use below command to create stack for jenkins 

aws cloudformation create-stack --stack-name myteststack --template-body file:///home/FutureAirlines/AutoScalingMultiAZWithNotifications.json --parameters ParameterKey=Parm1,ParameterValue=test1 ParameterKey=Parm2,ParameterValue=test2



