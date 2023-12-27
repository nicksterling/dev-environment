# Use the linuxserver/webtop:ubuntu-mate image as the base
FROM lscr.io/linuxserver/webtop:debian-mate

# Install several packages using yay
# RUN yay -Syu --noconfirm \
#     arc-gtk-theme \
#     arc-icon-theme \
#     age \
#     base-devel \
#     dnsutils \
#     firefox \
#     htop \
#     iputils \
#     net-tools \
#     plank \
#     tmux \
#     tree \
#     ttf-ubuntu-mono-nerd \ 
#     aur/ulauncher \
#     unzip \
#     vim \
#     aur/visual-studio-code-bin \
#     wget \
#     zsh && \
#     # Clear the package manager cache to reduce the size of the image
#     yay -Scc --noconfirm

RUN apt-get update && \ 
    apt-get install -y arc-theme \
    age \
    build-essential \
    curl \
    dnsutils \
    firefox-esr \
    git \
    gpg \
    htop \
    iputils-ping \
    mate-backgrounds \
    tmux \
    tree \
    unzip \
    vim \
    wget \
    zsh \
    && rm -rf /var/lib/apt/lists/*

RUN wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg && \
    install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg && \
    sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list' && \
    rm -f packages.microsoft.gpg && \
    apt-get update && \
    apt-get install -y code && \
    rm -rf /var/lib/apt/lists/*

# Read in an environment variable and change the abc user's password to it
ARG PASSWORD=defg
RUN echo "abc:$PASSWORD" | chpasswd

# Replace the contents of the file in /etc/sudoers.d/abc with 'abc ALL=(ALL) ALL'
# RUN echo "abc ALL=(ALL) ALL" > /etc/sudoers.d/abc

COPY skel /