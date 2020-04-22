#!/bin/bash
set -e -x

DNS_NAME="${DNS_NAME}"
TOKEN="${TOKEN}"
VERSION="${VERSION}"

# update
yum update -y

# jdk
yum remove -y java-1.7.0-openjdk
yum install -y java-1.8.0-openjdk java-1.8.0-openjdk-devel

mkdir /data

pushd /data

# keycloak
wget https://downloads.jboss.org/keycloak/${VERSION}/keycloak-${VERSION}.tar.gz
tar -zxvf keycloak-${VERSION}.tar.gz


# slack
if [ "$TOKEN" != "" ]; then
curl -sL opspresso.com/tools/slack | bash -s -- \
    --token="$TOKEN" --username="gitlab" \
    --footer_icon='https://about.gitlab.com/ico/favicon.ico' \
    --footer="<https://$DNS_NAME|gitlab>" \
    --title="Launched Keycloak"
fi
