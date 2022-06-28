#!/bin/bash

readonly SSH_KEY=~/.ssh/github-actions

clear

if [ -f $SSH_KEY ]; then
  rm $SSH_KEY 2>/dev/null
fi

echo -e "Please wait ...\n"

# Update packages
sudo apt-get update -qq 2>/dev/null

# Install docker-compose
sudo apt-get install -y -qq docker-compose 2>/dev/null

# Generate a new key named github-actions with an empty password
ssh-keygen -t rsa -b 4096 -f $SSH_KEY -q -P ""

# Copy the content of github-actions into authorized_keys
cat $SSH_KEY.pub >>~/.ssh/authorized_keys

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
