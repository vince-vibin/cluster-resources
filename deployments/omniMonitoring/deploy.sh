URL="https://eu-central-1-1.aws.cloud2.influxdata.com"
TOKEN="l-hLPh-gesbsHk88MyXmdkvWfwZ7vUvax7UKtX9sjvJk_a_u01stxY8c6CBalji9uafu_gw8QW38KZzNVNlhUw=="
BUCKET="rpc"
ORG="vincent.sternad@meconema.de"
DATA_RATE="10" # determins how often data is send to the database

# installing needed resscources
sudo apt update -y
sudo apt install -y git
sudo apt install -y libseccomp2

git clone https://github.com/mattogodoy/omni.git

sed -i "s|<your-url-here>|$URL|" ./omni/omni-install.yaml
sed -i "s|<your-token-here>|$TOKEN|" ./omni/omni-install.yaml
sed -i "s|<your-bucket-here>|$BUCKET|" ./omni/omni-install.yaml
sed -i "s|<your-organization-here>|$ORG|" ./omni/omni-install.yaml
sed -i "s|<your-organization-here>|$ORG|" ./omni/omni-install.yaml
sed -i "s|5|$DATA_RATE|" ./omni/omni-install.yaml


kubectl apply -f ./omni/omni-install.yaml
