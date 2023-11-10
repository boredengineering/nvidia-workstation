
Describe EC2 AMI using image-id
> ```aws ec2 describe-images --image-id ami-01c4415fd6c2f0927 --region us-west-2 --query 'sort_by(Images, &CreationDate)[-1].{Name: Name, ImageId: ImageId, CreationDate: CreationDate, Owner:OwnerId}' --output json --region us-west-2 --profile profile-name```<br/>

Describe EC2 AMI using image name
> ```aws ec2 describe-images --owners 679593333241 --filters "Name=name,Values=*Enclaves*" --region us-west-2 --query 'sort_by(Images, &CreationDate)[].{Name: Name, ImageId: ImageId, CreationDate: CreationDate, Owner:OwnerId}' --output json --region us-west-2 --profile profile-name```<br/>

> ```aws ec2 describe-images --owners 679593333241 --filters "Name=name,Values=ACM-For-Nitro-Enclaves*" --region eu-north-1 --query 'Images[*].[ImageId]' --output json --region eu-north-1 --profile profile-name```<br/>

### Setup AWS SSO profile
Check your configured Profiles<br/>
> ```aws configure list-profiles```<br/>

If not configured please properly configure a SSO profile<br/>
> ```aws configure sso --profile my-aws-sso-profile```<br/>

Login with your AWS SSO profile<br/>
> ```aws sso login --profile my-aws-sso-profile```<br/>

## Step 1 - Configure Environment
If using Windows you must use WSL2 with Ubuntu distro. Once running WSL with an appropriate distro it should be similar between Windows or Linux users.<br/>

Run WSL2<br/>
> ```wsl```<br/>
Now all commands will be as if working on Ubuntu 22.04 LTS<br/>

**Activate Python venv**<br/>
> ```source .vev/bin/activate```<br/>

**Check Ansible installation**<br/>
> ```which ansible``` <br/>

**Configure the Env Var ANSIBLE_CONFIG**<br/>
Go to the directory with ansible.cfg then<br/>
> ```export ANSIBLE_CONFIG=$(pwd)```<br/>

For Using the SSO profile must setup the Environment Variable.<br/>
- For Linux<br/>
> ```export AWS_PROFILE="my-aws-sso-profile"```<br/>

**Check Ansible**<br/>
> ```ansible --version```<br/>