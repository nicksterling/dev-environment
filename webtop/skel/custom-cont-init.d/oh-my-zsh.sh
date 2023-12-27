#!/bin/bash

OH_MY_ZSH_DIR="/config/.oh-my-zsh"

# If the .oh-my-zsh folder doesn't exist, then install Oh My ZSH and Powerlevel10k
if [ ! -d "$OH_MY_ZSH_DIR" ]; then
  echo "******* Installing Oh My ZSH *******"
  
  sudo -u abc sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
  if [ $? -ne 0 ]; then
    echo "Failed to install Oh My ZSH"
    exit 1
  fi

  echo "******* Installing Powerlevel10k *******"
  sudo -u abc git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
  if [ $? -ne 0 ]; then
    echo "Failed to clone Powerlevel10k"
    exit 1
  fi

  echo "******* Configuring the Home Directory *******"

  # Let's ensure the /backup/config folder is owned by abc
  echo "******* Changing ownership of /backup/config to abc *******"
  chown -R abc:abc /backup/config

  sudo -u abc copy /backup/config/.zshrc /config/.zshrc

fi