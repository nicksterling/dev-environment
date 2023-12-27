# Use the linuxserver/webtop:arch-mate image as the base
FROM lscr.io/linuxserver/webtop:arch-mate

# Update the package list, upgrade all packages, and install git
RUN pacman -Syu --noconfirm && \
    pacman -S git --noconfirm && \
    # Clear the package manager cache to reduce the size of the image
    pacman -Scc --noconfirm

# Change the working directory to /tmp
WORKDIR /tmp 
# Clone the yay AUR helper and change its ownership to the abc user
RUN git clone https://aur.archlinux.org/yay.git && \
    chown -R abc:abc /tmp/yay && \
    # Create the /config/.cache directory and change its ownership to the abc user
    mkdir -p /config/.cache && \
    chown -R abc:abc /config/.cache

# Switch to the abc user
USER abc
# Change the working directory to /tmp/yay
WORKDIR /tmp/yay 
# Install the yay package
RUN makepkg -si --noconfirm

# Change the working directory to /
WORKDIR /

# Install several packages using yay
RUN yay -Syu --noconfirm \
    arc-gtk-theme \
    arc-icon-theme \
    age \
    base-devel \
    dnsutils \
    firefox \
    htop \
    iputils \
    net-tools \
    plank \
    tmux \
    tree \
    ttf-ubuntu-mono-nerd \ 
    aur/ulauncher \
    unzip \
    vim \
    aur/visual-studio-code-bin \
    wget \
    zsh && \
    # Clear the package manager cache to reduce the size of the image
    yay -Scc --noconfirm

# Switch back to the root user
USER root

# Read in an environment variable and change the abc user's password to it
ARG PASSWORD=defg
RUN echo "abc:$PASSWORD" | chpasswd

# Replace the contents of the file in /etc/sudoers.d/abc with 'abc ALL=(ALL) ALL'
RUN echo "abc ALL=(ALL) ALL" > /etc/sudoers.d/abc

COPY skel /