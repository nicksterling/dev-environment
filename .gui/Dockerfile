FROM node:20-slim

RUN dpkg --add-architecture i386 && apt-get update && apt-get install -y libnss3-dev libgdk-pixbuf2.0-dev libgtk-3-dev libxss-dev libasound2-dev wine wine64 && rm -rf /var/lib/apt/lists/*

RUN ln -s /usr/bin/wine /usr/bin/wine64

WORKDIR /app
RUN chown -R node:node /app

USER node

COPY --chown=node:node . . 

RUN npm ci
