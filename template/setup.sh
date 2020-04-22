#!/bin/bash
set -e -x

DNS_NAME="${DNS_NAME}"
TOKEN="${TOKEN}"

# update
yum update -y

# jdk
yum remove -y java-1.7.0-openjdk
yum install -y java-1.8.0-openjdk java-1.8.0-openjdk-devel

mkdir /data

pushd /data

# keycloak
wget https://downloads.jboss.org/keycloak/9.0.3/keycloak-9.0.3.tar.gz
tar -zxvf keycloak-9.0.3.tar.gz


# slack
if [ "$TOKEN" != "" ]; then
curl -sL opspresso.com/tools/slack | bash -s -- \
    --token="$TOKEN" --username="gitlab" \
    --footer_icon='https://about.gitlab.com/ico/favicon.ico' \
    --footer="<https://$DNS_NAME|gitlab>" \
    --title="Launched Keycloak"
fi
