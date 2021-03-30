#!/usr/bin/env bash
set -e

echo "Adding additional packages repositories..."
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

echo "Installing packages..."
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y git git-flow openjdk-8-jdk-headless openjdk-11-jre-headless maven jq unzip awscli nodejs npm \
                        yarn software-properties-common python3.9 xfce4 xfce4-terminal
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash

echo "Linking Maven .m2 directory on wsl distro..."
mkdir -p /mnt/c/Users/$USER/.m2/
ln -sf /mnt/c/Users/$USER/.m2/ $HOME/

echo "Creating common directories..."
mkdir $HOME/.local/bin

echo "Linking .ssh directory on wsl distro..."
mkdir $HOME/.ssh
cat /mnt/c/Users/$USER/.ssh/id_rsa > $HOME/.ssh/id_rsa
cat /mnt/c/Users/$USER/.ssh/id_rsa.pub > $HOME/.ssh/id_rsa.pub
chmod 400 /mnt/c/Users/$USER/.ssh/id_rsa
chmod 400 /mnt/c/Users/$USER/.ssh/id_rsa.pub

echo "Linking dev home directory on wsl distro..."
ln -sf /mnt/c/Users/$USER/dev/ $HOME/

echo "Linking Docker configuration on wsl distro..."
sudo mkdir -p /etc/docker
sudo ln -sf /mnt/c/Users/$USER/.docker/daemon.json /etc/docker/daemon.json

echo "Linking .aws configuration on wsl distro..."
mkdir -p /mnt/c/Users/$USER/.aws/
ln -sf /mnt/c/Users/$USER/.aws/  $HOME/

echo "Linking .npmrc configuration on wsl distro..."
ln -sf /mnt/c/Users/$USER/.npmrc  $HOME/.npmrc

echo "Linking .yarnrc configuration on wsl distro..."
ln -sf /mnt/c/Users/$USER/.yarnrc  $HOME/.yarnrc

echo "Configuring general environment variables..."
echo "export WSL_USER_HOME=/mnt/c/Users/\$USER" >> ~/.bashrc
echo "export WSL_HOST=\$(cat /etc/resolv.conf | grep nameserver | awk '{print \$2; exit;}')" >> ~/.bashrc
echo "export DISPLAY=\$WSL_HOST:0.0" >> ~/.bashrc

echo "Finished!"
