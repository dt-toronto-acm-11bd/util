#!/bin/bash
CREDS=/home/ec2-user/util/provision-acm-openshift/scripts/creds.json

echo Please enter the credentials as requested below:
read -p "Jenkins User: (default=admin) " JUSER 
read -p "Jenkins Password: (default=admin) " JPWD  
read -p "Dynatrace Tenant: " DTENV 
read -p "Dynatrace API Token: " DTAPI
read -p "github User Name: " GITU
read -p "github Personal Access Token: " GITAT
read -p "github User Email: " GITE
read -p "github Organization: " GITO
echo ""
echo ""
echo "Please confirm all are correct:"
echo "Jenkins User: $JUSER"
echo "Jenkins Password: $JPWD"
echo "Dynatrace Tenant: $DTENV.live.dynatrace.com"
echo "Dynatrace API TOken: $DTAPI"
echo "github User Name: $GITU"
echo "github Personal Access Token: $GITAT"
echo "github User Email: $GITE"
echo "github Organization: $GITO" 
read -p "Is this all correct?" -n 1 -r
echo ""
if [[ $REPLY =~ ^[Yy]$ ]]
then
  sed -i 's/JENKINS_USER_PLACEHOLDER/'"$JUSER"'/' $CREDS 
  sed -i 's/JENKINS_PASSWORD_PLACEHOLDER/'"$JPWD"'/' $CREDS
  sed -i 's/DYNATRACE_TENANT_PLACEHOLDER/'"$DTENV"'/' $CREDS
  sed -i 's/DYNATRACE_API_TOKEN/'"$DTAPI"'/' $CREDS
  sed -i 's/GITHUB_USER_NAME_PLACEHOLDER"/'"$GITU"'/' $CREDS
  sed -i 's/PERSONAL_ACCESS_TOKEN_PLACEHOLDER"/'"$GITAT"'/' $CREDS
  sed -i 's/GITHUB_USER_EMAIL_PLACEHOLDER"/'"$GITE"'/' $CREDS
  sed -i 's/GITHUB_ORG_PLACEHOLDER/'"$GITO"'/' $CREDS
fi
cat $CREDS
echo ""
echo "the creds file can be found here:" $CREDS
echo ""

