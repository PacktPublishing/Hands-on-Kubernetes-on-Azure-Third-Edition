#!/bin/bash
# This script is used to decode the Key Vault secret created by ASO in values that can be used in the helm chart for WordPress

FQDN=$(echo $1 | jq -r .fullyQualifiedServerName | base64 -d)
USER=$(echo $1 | jq -r .fullyQualifiedUsername | base64 -d)
PASSWD=$(echo $1 | jq -r .password | base64 -d)

echo "externalDatabase.host='$FQDN'"
echo "externalDatabase.user='$USER'"
echo "externalDatabase.password='$PASSWD'"