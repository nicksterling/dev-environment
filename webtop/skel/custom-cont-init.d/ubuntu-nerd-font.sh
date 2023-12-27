# Install the Nerd Fonts

if [ ! -f "/config/.local/share/fonts/UbuntuMonoNerdFontMono-Regular.ttf" ]; then
  echo "******* Installing Nerd Fonts *******"
  sudo -u abc mkdir -p /config/.local/share/fonts
  cd /config/.local/share/fonts
  sudo -u abc curl -JLO https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/UbuntuMono.zip
  if [ $? -ne 0 ]; then
    echo "Failed to download Nerd Fonts"
    exit 1
  fi
   
  sudo -u abc unzip UbuntuMono.zip -d ~/.local/share/fonts
  if [ $? -ne 0 ]; then
    echo "Failed to unzip Nerd Fonts"
    exit 1
  fi

  rm UbuntuMono.zip
fi
