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


Links útiles:
1. AWS CLI:
https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-welcome.html
https://docs.aws.amazon.com/cli/latest/reference/deploy/index.html

2. Aws Codedeploy:
Conceptos: https://docs.aws.amazon.com/codedeploy/latest/userguide/welcome.html
Guías: 
Setup Codedeploy: https://docs.aws.amazon.com/codedeploy/latest/userguide/getting-started-codedeploy.html
Integración con Github: https://docs.aws.amazon.com/codedeploy/latest/userguide/tutorials-github.html
Syntax: `appspec.yml` https://docs.aws.amazon.com/codedeploy/latest/userguide/reference-appspec-file.html#appspec-reference-server, https://docs.aws.amazon.com/codedeploy/latest/userguide/reference-appspec-file-structure-hooks.html

3. Github Actions
https://docs.github.com/en/actions

4. Bash scripts (anexo por si lo necesitan):
https://matt.might.net/articles/bash-by-example/#:~:text=To%20create%20a%20bash%20script,the%20top%20of%20the%20file.&text=To%20execute%20the%20script%20from,%2Fpath%2Fto%2Finterpreter%20.

Les recomiendo primero familiarizarse con los conceptos de CD para que planeen cual es el flujo de CD que deben armar, hacer un diagrama que vean claramente que servicio llama a cual para que no tengan problemas por el diseño de su CD.

Ya planeado su CD hagan todo el flujo de manera manual primero, vean que comandos necesitan para levantar y detener su aplicación, en que directorio del EC2 irá cada archivo etc...
Una vez que ya hagan el hecho el deploy de forma manual les recomiendo seguir las siguientes guías para configurar todo lo necesario.
Primero seguir paso por paso la guía de *Gettting Started* de `CodeDeploy`, luego seguir la guía de integración con Github, al mismo tiempo crear su `appspec.yml` con toda la configuración necesaria para que se corran los hooks que levantan y detienen su app. Por último una vez que la creación de deployments en `CodeDeploy` les funcione de manera correcta hagan el workflow de CircleCI/Github Actions que les cree el deployment de manera automática cuando pushean a main, que les pushee el último commit.

Cualquier duda pregunten pues la creación de un buen flujo de CD no siempre es fácil y puede ser difícil de debuguear la primera vez que se hace.

Nota: Si tienen problemas de memoria por mucho uso de docker pueden hacer un flujo de CD buildeando las imagenes, subiendolas al registry de aws (ECR) o de docker (dockerhub) y cambian los scripts de los hooks para que levanten su app de manera correcta.