URL="https://eu-central-1-1.aws.cloud2.influxdata.com"
TOKEN="l-hLPh-gesbsHk88MyXmdkvWfwZ7vUvax7UKtX9sjvJk_a_u01stxY8c6CBalji9uafu_gw8QW38KZzNVNlhUw=="
BUCKET="rpc"
ORG="vincent.sternad@meconema.de"
DATA_RATE="10" # determins how often data is send to the database (in seconds)

function handleError() {
    currDate=`date +%D-%T`
    echo "$currDate | CRITICAL ERROR - " $1
    exit 0
}

{
    # installing needed resscources
    sudo apt update -y || handleError
    sudo apt install -y git || handleError
    sudo apt install -y libseccomp2 || handleError
} || {
    handleError "Error while trying to install needed ressources"
}


git clone https://github.com/mattogodoy/omni.git || handleError "Error while trying to clone omni repository"

{
    sed -i "s|<your-url-here>|$URL|" ./omni/omni-install.yaml
    sed -i "s|<your-token-here>|$TOKEN|" ./omni/omni-install.yaml 
    sed -i "s|<your-bucket-here>|$BUCKET|" ./omni/omni-install.yaml 
    sed -i "s|<your-organization-here>|$ORG|" ./omni/omni-install.yaml 
    sed -i "s|<your-organization-here>|$ORG|" ./omni/omni-install.yaml 
    sed -i "s|5|$DATA_RATE|" ./omni/omni-install.yaml
} || { 
    handleError "Error while trying to write in config file"
}

kubectl apply -f ./omni/omni-install.yaml || handleError "Error while trying to apply omni-install.yaml"
