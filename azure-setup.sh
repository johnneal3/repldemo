#! /bin/bash

RESOURCE_GROUP=jnealdemorg
LOCATION=eastus
VM=jnealdemo

echo "creating resource group"
az group create --name $RESOURCE_GROUP --location $LOCATION

echo "creating virtual machine"
az vm create \
   --resource-group $RESOURCE_GROUP \
   --name $VM \
   --image CentOS \
   --admin-username jneal \
   --size Standard_D2s_v3 \
   --generate-ssh-keys

#   --custom-data cloud-init.yml

echo "opening port for replicate"
az vm open-port --resource-group $RESOURCE_GROUP --name $VM --port 3552
