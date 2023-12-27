#!/bin/bash

# This script is needed due to a strane timing issue....
if [ -z "$SLEEP_TIMEOUT" ]; then
    SLEEP_TIMEOUT=5
fi
echo "Sleeping for $SLEEP_TIMEOUT seconds"
sleep $SLEEP_TIMEOUT


echo "COPYING .zshrc"
sudo -u abc cp /backup/config/.zshrc /config/.zshrc
sudo -u abc cp /backup/config/.p10k.zsh /config/.p10k.zsh
sudo -u abc cp /backup/config/.tmux.conf /config/.tmux.conf