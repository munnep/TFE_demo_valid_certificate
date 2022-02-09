#!/usr/bin/env bash

# We have to wait for TFE be fully functioning before we can continue
while true; do
    if curl -I "https://patrick-tfe.bg.hashicorp-success.com/admin" 2>&1 | grep -w "200\|301" ; 
    then
        echo "TFE is up and running"
        echo "Will continue in 1 minutes with the final steps"
        sleep 60
        break
    else
        echo "TFE is not available yet. Please wait..."
        sleep 60
    fi
done

pushd /vagrant/config

initial_token=$(/usr/local/bin/replicated admin --tty=0 retrieve-iact | tr -d '\r')

curl \
  --header "Content-Type: application/json" \
  --request POST \
  --data @create_tfe_user.json \
  https://patrick-tfe.bg.hashicorp-success.com/admin/initial-admin-user?token=${initial_token}

echo ""
echo "#######################################################################"
echo "#              TFE installation complete                              #"
echo "# TFE dashboard: https://patrick-tfe.bg.hashicorp-success.com:8800    #"
echo "# TFE Application: https://patrick-tfe.bg.hashicorp-success.com       #" 
echo "#######################################################################"
