# cd-codedeploy
A sample project to deploy a simple application with AWS Codedeploy into an EC2 instance


## Steps for the CD
https://docs.aws.amazon.com/codedeploy/latest/userguide/reference-appspec-file-structure-files.html

1. Configure AWS CLI in our computer to use it for debbugging (not necessary but recommended)
2. Configure aws IAM Roles for CodeDeploy
3. Configure aws IAM Roles for EC2
4. Configure aws IAM User for EC2 (needed for AwsCodeDeploy agent to work)
5. Attach the EC2 Role to the EC2 IAM User
6. Create EC2 Instance with the IAM Role
7. Install Aws CodeDeploy Agent in the instance
8. If the instance was already running and the IAM Role is attached earlier you need to restart the CodeDeploy Agent Service in ubuntu `sudo service restart ...`
9. Create Application to deploy and upload to github
10. Create `appspec.yml` file and configure agent flow
11. Create hooks `.sh` scripts for the agent flow
12. Make manual deployment in aws console to test previous steps
13. Create Github Action with aws credentials to automate deployment creation


Useful for debbuging:
1. The logs of the aws code deploy agent are in the `/var/log/aws/codedeploy-agent` directory and can be used to see the logs directly on the machine

2. If the deployment fails because of previous deployment caching the content on `/opt/codedeploy-agent/deployment-root` can be deleted because it will be recreated in the new deployments.

# En vivo