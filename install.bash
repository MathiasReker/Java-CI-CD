#!/bin/bash

env_file=~/.env
ssh_key=~/.ssh/github-actions

if [ -f $env_file ]; then
   rm $env_file 2>/dev/null
fi

if [ -f $ssh_key ]; then
   rm $ssh_key 2>/dev/null
fi

# Add environment variables
array=(MYSQL_ROOT_PASSWORD MYSQL_DATABASE MYSQL_USER MYSQL_PASSWORD DOCKER_IMAGE_NAME GITHUB_USER)
for i in "${array[@]}"; do
  # Type the text that you want to append
  read -rp "$i: " newtext

  # Check the new text is empty or not
  if [ "$newtext" != "" ]; then
    # Append the text by using '>>' symbol
    echo "$i=$newtext" >>"$env_file"
  fi
done

echo Please wait ...

# Update and upgrade packages
sudo apt-get update -qq 2>/dev/null
sudo apt-get -y -qq upgrade 2>/dev/null

# Install docker-compose
sudo apt-get install -y -qq docker-compose 2>/dev/null

# Generate a new key named github-actions with an empty password
ssh-keygen -t rsa -b 4096 -f $ssh_key -q -P ""

# Copy the content of github-actions into authorized_keys
cat $ssh_key.pub >>~/.ssh/authorized_keys

# Get GitHub secrets
SSH_USER=$(whoami)
SSH_HOST=$(echo "$SSH_CLIENT" | awk '{print $1}')
SSH_PRIVATE_KEY=$(cat ~/.ssh/github-actions)

GREEN="32"
BOLDGREEN="\e[1;${GREEN}m"
ENDCOLOR="\e[0m"

echo -e "SSH_USER: ${BOLDGREEN}${SSH_USER}${ENDCOLOR}"
echo -e "SSH_HOST: ${BOLDGREEN}${SSH_HOST}${ENDCOLOR}"
echo -e "SSH_PRIVATE_KEY: ${BOLDGREEN}${SSH_PRIVATE_KEY}${ENDCOLOR}"
github@test:~$ cat test.sh
#!/bin/bash

env_file=~/.env
ssh_key=~/.ssh/github-actions

if [ -f $env_file ]; then
   rm $env_file 2>/dev/null
fi

if [ -f $ssh_key ]; then
   rm $ssh_key 2>/dev/null
fi

# Add environment variables
array=(MYSQL_ROOT_PASSWORD MYSQL_DATABASE MYSQL_USER MYSQL_PASSWORD DOCKER_IMAGE_NAME GITHUB_USER)
for i in "${array[@]}"; do
  # Type the text that you want to append
  read -rp "$i: " newtext

  # Check the new text is empty or not
  if [ "$newtext" != "" ]; then
    # Append the text by using '>>' symbol
    echo "$i=$newtext" >>"$env_file"
  fi
done

echo Please wait ...

# Update and upgrade packages
sudo apt-get update -qq 2>/dev/null
sudo apt-get -y -qq upgrade 2>/dev/null

# Install docker-compose
sudo apt-get install -y -qq docker-compose 2>/dev/null

# Generate a new key named github-actions with an empty password
ssh-keygen -t rsa -b 4096 -f $ssh_key -q -P ""

# Copy the content of github-actions into authorized_keys
cat $ssh_key.pub >>~/.ssh/authorized_keys

# Get GitHub secrets
SSH_USER=$(whoami)
SSH_HOST=$(echo "$SSH_CLIENT" | awk '{print $1}')
SSH_PRIVATE_KEY=$(cat ~/.ssh/github-actions)

GREEN="32"
BOLDGREEN="\e[1;${GREEN}m"
ENDCOLOR="\e[0m"

echo -e "SSH_USER: ${BOLDGREEN}${SSH_USER}${ENDCOLOR}"
echo -e "SSH_HOST: ${BOLDGREEN}${SSH_HOST}${ENDCOLOR}"
echo -e "SSH_PRIVATE_KEY: ${BOLDGREEN}${SSH_PRIVATE_KEY}${ENDCOLOR}"
