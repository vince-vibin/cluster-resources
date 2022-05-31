TOKEN="l-hLPh-gesbsHk88MyXmdkvWfwZ7vUvax7UKtX9sjvJk_a_u01stxY8c6CBalji9uafu_gw8QW38KZzNVNlhUw=="
BUCKET="rpc"
URL="https://eu-central-1-1.aws.cloud2.influxdata.com"
ORG="vincent.sternad@meconema.de"

# installing needed resscources
sudo apt update -y
sudo apt install -y git
sudo apt install -y libseccomp2

git clone https://github.com/mattogodoy/omni.git