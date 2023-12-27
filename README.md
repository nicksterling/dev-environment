# Webtop Dev Environment

## Overview

**Webtop Dev Environment** is a Docker image that provides a full development environment within a web browser. It builds on the [LinuxServer.io Webtop](https://docs.linuxserver.io/images/docker-webtop/) Docker image, adding some of my commonly used tools and fixes for my day-to-day use.

### Key Features:
- **Bashly CLI Application**: A custom command-line interface for simplifying complex tasks.
- **Enhanced Docker Integration**: An ext4 filesystem for Docker, enabling Kubernetes and other container orchestration platforms to work inside the Webtop.
- **Integrated Full-Screen Electron GUI**: A borderless, full-screen Electron application for a streamlined development environment.

## Prerequisites

Ensure your system meets the following prerequisites before setting up the Webtop Dev Environment:

### Operating Systems Supported
- Mac
- Windows
- Linux

### Software Requirements

#### For Mac:
- Docker Desktop or Colima
- Homebrew
- Bash 4 or later (install via `brew install bash`)

#### For Windows: 
Note: Windows is currently untested. It *should* work. 
- Docker Desktop
- WSL2 (Windows Subsystem for Linux 2)

#### For Linux:
- Docker
- Docker Compose
- Docker Buildx

## Usage

The `wt` command-line tool is included for managing the Docker container and GUI. This was originally a Makefile but I needed something a little more flexible for future expansion. 

### Commands

#### Docker Container Management
This will start and stop the webtop environment itself
- **Start Docker Container**: `wt start --env [env]`
- **Stop Docker Container**: `wt stop [--delete-volumes]`

#### GUI Management
You could connect to a browser session on https://localhost:3001 or use this electrion app that's a borderless fullscreen app
- **Open GUI**: `wt gui start --os [os] --arch [arch]`
- **Stop GUI**: `wt gui stop`
- **Build GUI**: `wt gui build --os [os] --arch [arch]`

#### Colima Virtual Machine Management
Here's some of my colima settings on how I run the environment in MacOS
- **VM Status**: `wt colima status`
- **Create VM**: `wt colima create`
- **Destroy VM**: `wt colima destroy`

## License

This project is licensed under the MIT License. For more details, see the LICENSE file in the repo.
