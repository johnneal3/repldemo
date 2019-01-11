#! /bin/bash

RESOURCE_GROUP=jnealdemorg
LOCATION=eastus
VM=jnealdemo


create_resource_group() {
  echo "creating resource group"
  az group create --name $RESOURCE_GROUP --location $LOCATION
}

create_vm() {
   echo "creating virtual machine"
   az vm create \
      --resource-group $RESOURCE_GROUP \
      --name $VM \
      --image CentOS \
      --admin-username jneal \
      --size Standard_D2s_v3 \
      --generate-ssh-keys

   # Haven't been able to get this to work as of yet.
   #   --custom-data cloud-config.yml

   echo "opening ports 3552 for replicate"
   az vm open-port --resource-group $RESOURCE_GROUP --name $VM --port 3552 --priority 100
   
   echo "opening port 9000 for portainer"
   az vm open-port --resource-group $RESOURCE_GROUP --name $VM --port 9000 --priority 101
}

create_sql_server() {
echo "creating a SQL Server instance"
   # first we need a SQL Server
   echo "creating SQL server instance"
   az sql server create --location $LOCATION --name jnealsqlsrv \
       --resource-group $RESOURCE_GROUP --admin-password welcome1@ --admin-user demo

   # still need to get the final syntax to connect the SQL Server instance to the
   # virtual network of the VM.
   echo "TODO: configure vnet-rule for SQL Server"
   #  az sql server vnet-rule create --help

   # open the ports required by Replicate
   echo "opening port 1433 for SQL Server"
   az vm open-port --resource-group $RESOURCE_GROUP --name $VM --port 1433 --priority 102

   echo "opening port range 11000-11999 for SQL Server"
   az vm open-port --resource-group $RESOURCE_GROUP --name $VM --port 11000-11999 --priority 103

   echo "opening port range 14000-14999 for SQL Server"
   az vm open-port --resource-group $RESOURCE_GROUP --name $VM --port 14000-14999 --priority 104
}

create_sql_db() {
   echo "creating a SQL Server database"
   az sql db create --name jnealsqldb --resource-group $RESOURCE_GROUP \
      --server jnealsqlsrv --max-size 5GB --service-objective S1 --zone-redundant false 
}

create_sql_dw() {
   echo "creating a SQL DW instance"
   az sql dw create --name jnealsqldw --resource-group $RESOURCE_GROUP --server  jnealsqlsrv --service-objective DW100
}

create_event_hubs() {
   echo "creating Azure Eventhubs"
   az eventhubs eventhub create --resource-group $RESOURCE_GROUP --namespace-name repldemo \
      --name jnealeventhub --message-retention 1 ---partition-count 2
}

create_adls() {
   echo "creating an ADLS Gen1 storage account"
   az dls account create --account jnealadlsgen1 --location eastus2 --resource-group $RESOURCE_GROUP

   echo "creating a folder for demo data"
   az dls fs create --account jnealadlsgen1 --path /repldemo --folder
}

create_resource_group

create_vm


