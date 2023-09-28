
Describe EC2 AMI using image-id
> ```aws ec2 describe-images --image-id ami-01c4415fd6c2f0927 --region us-west-2 --query 'sort_by(Images, &CreationDate)[-1].{Name: Name, ImageId: ImageId, CreationDate: CreationDate, Owner:OwnerId}' --output json --region us-west-2 --profile profile-name```<br/>

Describe EC2 AMI using image name
> ```aws ec2 describe-images --owners 679593333241 --filters "Name=name,Values=*Enclaves*" --region us-west-2 --query 'sort_by(Images, &CreationDate)[].{Name: Name, ImageId: ImageId, CreationDate: CreationDate, Owner:OwnerId}' --output json --region us-west-2 --profile profile-name```<br/>

> ```aws ec2 describe-images --owners 679593333241 --filters "Name=name,Values=ACM-For-Nitro-Enclaves*" --region eu-north-1 --query 'Images[*].[ImageId]' --output json --region eu-north-1 --profile profile-name```<br/>