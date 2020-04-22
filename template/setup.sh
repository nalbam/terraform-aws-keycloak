#!/bin/bash
set -e -x

DNS_NAME="${DNS_NAME}"
TOKEN="${TOKEN}"

VERSION="${VERSION}"

PRIVATE_IP="${PRIVATE_IP}"

# update
yum update -y

# jdk
yum remove -y java-1.7.0-openjdk
yum install -y java-1.8.0-openjdk java-1.8.0-openjdk-devel

pushd /home/ec2-user

# keycloak
wget https://downloads.jboss.org/keycloak/${VERSION}/keycloak-${VERSION}.tar.gz
tar -zxvf keycloak-${VERSION}.tar.gz

./keycloak-${VERSION}/bin/standalone.sh -b ${PRIVATE_IP}

popd

# slack
if [ "$TOKEN" != "" ]; then
curl -sL opspresso.com/tools/slack | bash -s -- \
    --token="$TOKEN" --username="gitlab" \
    --footer_icon='https://about.gitlab.com/ico/favicon.ico' \
    --footer="<https://$DNS_NAME|gitlab>" \
    --title="Launched Keycloak"
fi
