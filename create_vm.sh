# create public ip
az network public-ip create --resource-group {{resource-group-name}} --name {{public-ip-name}} --allocation-method {{Static, Dynamic}} --sku {{Standard}} --zone {{1,2,3}}
# zones refer to availability zones

# create nic
az network nic create --resource-group {{resource-group-name}} --name {{nic-name}} --vnet-name {{vnet-name}} --subnet {{subnet-name}} --public-ip-address {{public-ip-name}}

# create vm with public ip
az vm create --resource-group {{resource-group-name}} --name {{vm_name}} --nics {{nic-name}} --image {{image-os-name}} --ssh-key-name {{ssh-key-name}}

# open port 22 for ssh
az vm open-port --port 22 --resource-group {{resource-group-name}} --name {{vm_name}}

# connect through ssh (computer username, not azureuser)
ssh -i {{private-key-path}} {{computer-username}}@{{public-ip-vm}}

