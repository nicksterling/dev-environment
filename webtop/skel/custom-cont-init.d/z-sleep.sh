#!/bin/bash

# This script is needed due to a strane timing issue....
echo "Sleeping for 5 seconds to allow the container to start up..."
sleep 5

echo "COPYING .zshrc"
sudo -u abc cp /backup/config/.zshrc /config/.zshrc
sudo -u abc cp /backup/config/.p10k.zsh /config/.p10k.zsh
sudo -u abc cp /backup/config/.tmux.conf /config/.tmux.conf