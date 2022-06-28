#!/bin/bash

ssh_key=~/.ssh/github-actions

clear

if [ -f $ssh_key ]; then
  rm $ssh_key 2>/dev/null
fi

echo -e "Please wait ...\n"

# Update packages
sudo apt-get update -qq 2>/dev/null

# Install docker-compose
sudo apt-get install -y -qq docker-compose 2>/dev/null

# Generate a new key named github-actions with an empty password
ssh-keygen -t rsa -b 4096 -f $ssh_key -q -P ""

# Copy the content of github-actions into authorized_keys
cat $ssh_key.pub >>~/.ssh/authorized_keys

# Get GitHub secrets
SSH_USER=$(whoami)
SSH_HOST=$(curl ifconfig.me)
SSH_PRIVATE_KEY=$(cat ~/.ssh/github-actions)

RED="31"
BOLDRED="\e[1;${RED}m"
ENDCOLOR="\e[0m"

echo -e "SSH_USER: ${BOLDRED}${SSH_USER}${ENDCOLOR}"
echo -e "SSH_HOST: ${BOLDRED}${SSH_HOST}${ENDCOLOR}"
echo -e "SSH_PRIVATE_KEY: ${BOLDRED}${SSH_PRIVATE_KEY}${ENDCOLOR}"
