# Nvidia AMIs<br/>

**Linux**<br/>

AMI name: NVIDIA Omniverse GPU-Optimized AMI<br/>

Search using:<br/>
> ```aws ec2 describe-images --owners 523997997732 --filters "Name=name,Values=NVIDIA Omniverse GPU-Optimized AMI" --region us-west-2 --query 'sort_by(Images, &CreationDate)[].{Name: Name, ImageId: ImageId, CreationDate: CreationDate, Owner:OwnerId}' --output json --region us-west-2 --profile profile-name```<br/>

US regions:<br/>
> - us-east-1 ---- ami-06b31067ee2e5bff3<br/>
> - us-east-2 ----  ami-0c7bff3c28940fddf<br/>
> - us-west-1 ----  ami-033607a2699def9ca<br/>
> - us-west-2 ----  ami-05c519412a83cc291<br/>

Asia<br/>
> - ap-south-1 ----  ami-0324250976fa70eaa<br/>
> - ap-northeast-1 ----  ami-0b80013fa8543245b<br/>
> - ap-northeast-2 ----  ami-07f7c06f680d36272<br/>
> - ap-northeast-3 ----  ami-014b8f2294fe84327<br/>
> - ap-southeast-1 ----  ami-001901ec28f067679<br/>
> - ap-southeast-2 ----  ami-08b05db0ae3d5c4a1<br/>

Canada<br/>
> - ca-central-1 ----  ami-0235a53546b2f0a1a<br/>

Europe<br/>
> - eu-north-1 ----  ami-0da6187c82ff5d08f<br/>
> - eu-central-1 ----  ami-058bf92e7086f5d66<br/>
> - eu-west-1 ----  ami-047763cdf1aed030c<br/>
> - eu-west-2 ----  ami-05770e7198f328aa9<br/>
> - eu-west-3 ----  ami-04fa9cfa5f6a27933<br/>

South America<br/>
> - sa-east-1 ----  ami-0701e91c83746cb9e<br/>

**Windows**<br/>
AMI name: NVIDIA Omniverse VDI Windows Image (for use with g5 instances)<br/>

Search using:<br/>
> ```aws ec2 describe-images --owners 599914391307 --filters "Name=name,Values=NVIDIA Omniverse VDI Windows Image (for use with g5 instances)" --region us-west-2 --query 'sort_by(Images, &CreationDate)[].{Name: Name, ImageId: ImageId, CreationDate: CreationDate, Owner:OwnerId}' --output json --region us-west-2 --profile profile-name```<br/>

US regions:<br/>
> - us-east-1 ---- ami-0dcec325865672a69<br/>
> - us-east-2 ----  ami-0916ae573e02ee0ff<br/>
> - us-west-1 ----  ami-06a17fb1611800254<br/>
> - us-west-2 ----  ami-0534fdd8c35a9ccfa<br/>

Asia<br/>
> - ap-south-1 ----  ami-08f7ddc473d6f6c3b<br/>
> - ap-northeast-1 ----  ami-0418236aa5f4a6f94<br/>
> - ap-northeast-2 ----  ami-0dd00e72698c62e82<br/>
> - ap-northeast-3 ----  ami-0543d8d7aa1c16b18<br/>
> - ap-southeast-1 ----  ami-010a94386d8dadd99<br/>
> - ap-southeast-2 ----  ami-09f9bbf131c60b6c3<br/>
> - ap-southeast-3 ----  ami-0aed60914cbc7ab1f<br/>
> - ap-east-1 ----  ami-07f1086336d6adbf8<br/>


Canada<br/>
> - ca-central-1 ----  ami-0f512608f260ab9dd<br/>

Europe<br/>
> - eu-north-1 ----  ami-08ceb3ad424d8930c<br/>
> - eu-central-1 ----  ami-039e6328e4f7724ee<br/>
> - eu-central-2 ----  ami-0e15d01edc3018391<br/>
> - eu-west-1 ----  ami-09ea6806bd25bf674<br/>
> - eu-west-2 ----  ami-0983872285bf7a024<br/>
> - eu-west-3 ----  ami-0b4ee33ddb70fbb3b<br/>
> - eu-south-1 ----   ami-0664828de4aa709de<br/>
> - eu-south-2 ----   ami-06c621c54afff3ae8<br/>

South America<br/>
> - sa-east-1 ----  ami-0805bba2bf579a124<br/>

> - af-south-1 ----   ami-0c27d657969c09177<br/>
> - me-south-1 ----   ami-025ccef8608bd9d7c<br/>
> - me-central-1 ----   ami-0be8ac642fb1c6fa6<br/>