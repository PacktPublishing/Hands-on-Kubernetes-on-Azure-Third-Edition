# make sure to edit your unique DNS name
# If you changed the name or location of your AKS cluster, make sure to edit them throughout this document.

az group create -n agic -l westus2

az network public-ip create -n agic-pip \
    -g agic --allocation-method Static --sku Standard \
    --dns-name "<your unique dns name>"
az network vnet create -n agic-net -g agic \
    --address-prefix 192.168.0.0/24 --subnet-name agic-subnet \
    --subnet-prefix 192.168.0.0/24

az network application-gateway create -n agic -l westus2 \
    -g agic --sku Standard_v2 --public-ip-address agic-pip \
    --vnet-name agic-vnet --subnet agic-subnet

appgwId = $(az network application-gateway \
    show -n agic -g agic -o tsv --query "id")
az aks enable-addons -n handsonaks \
    -g rg-handsonaks -a ingress-appgw \
    --appgw-id $appgwId

nodeResourceGroup =$(az aks show -n handsonaks\
    -g rg-handsonaks -o tsv --query "nodeResourceGroup")
aksVnetName=$(az network vnet list \
    -g $nodeResourceGroup -o tsv --query "[0].name")

aksVnetId=$(az network vnet show -n $aksVnetName \
    -g $nodeResourceGroup -o tsv --query "id")
az network vnet peering create \
    -n AppGWtoAKSVnetPeering -g agic \
    --vnet-name agic-net --remove-vnet $aksVnetId \
    --allow-vnet-access

appGWVnetId=$(az network vnet show -n agic-vnet \
    -g agic -o tsv --query "id")
az network vnet peering create \
    -n AKStoAppGWVnetPeering -g $nodeResourceGroup \
    --vnet-name $aksVnetName --remote-vnet $appGWVnetId \
    --allow-vnet-access
