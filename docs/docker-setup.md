# Docker Setup Guide

This guide covers the installation of Docker Engine, Docker Desktop, and Docker Compose on Ubuntu.

## Installing Docker Engine

### Set up Docker's apt Repository

First, set up Docker's apt repository by following these steps:

```bash
# Update the apt package index and install required packages
sudo apt-get update
sudo apt-get install ca-certificates curl

# Add Docker's official GPG key
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
```

### Install Docker Engine and Related Packages

Install the latest version of Docker Engine, containerd, and Docker Compose:

```bash
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
```

### Verify the Installation

Verify that Docker Engine is installed correctly by running the hello-world image:

```bash
sudo docker run hello-world
```

### Post-installation Steps (Optional)

To use Docker without sudo, add your user to the docker group:

```bash
# Create the docker group if it doesn't exist
sudo groupadd docker

# Add your user to the docker group
sudo usermod -aG docker $USER

# Verify your user is in the docker group
groups $USER

# Apply the new group membership without logging out
newgrp docker
```

Log out and log back in for the changes to take effect.

## Installing Docker Desktop (Optional)

Docker Desktop provides a user-friendly interface for managing containers. Here's how to install it:

1. Ensure Docker Engine is installed (follow steps above)

2. Download the latest DEB package from the [Docker Desktop releases page](https://docs.docker.com/desktop/release-notes/)

3. Install the package:

   ```bash
   sudo apt-get update
   sudo apt-get install ./docker-desktop-<version>.deb
   ```

   Note: Replace `<version>` with the actual version number of the downloaded package.

   You may see a permission-related warning during installation which can be safely ignored:

   ```bash
   N: Download is performed unsandboxed as root, as file couldn't be accessed by user '_apt'. - pkgAcquire::Run (13: Permission denied)
   ```

Docker Desktop will be installed in `/opt/docker-desktop`.

## Using Docker Compose

Docker Compose comes installed with both Docker Engine (as a plugin) and Docker Desktop. You can use it in two ways:

1. Using the plugin (recommended):

   ```bash
   docker compose up
   ```

2. Using docker-compose (legacy):

   ```bash
   docker-compose up
   ```

### Basic Docker Compose Commands

- Start services: `docker compose up`
- Start services in detached mode: `docker compose up -d`
- Stop services: `docker compose down`
- View logs: `docker compose logs`
- List services: `docker compose ps`

### Example docker-compose.yml

Here's a basic example of a `docker-compose.yml` file:

```yaml
version: '3.8'
services:
  web:
    image: nginx:latest
    ports:
      - "80:80"
  db:
    image: postgres:latest
    environment:
      POSTGRES_PASSWORD: example
```

## Troubleshooting

If you encounter any issues:

1. Check Docker service status:

   ```bash
   sudo systemctl status docker
   ```

2. Restart Docker service:

   ```bash
   sudo systemctl restart docker
   ```

3. View Docker logs:

   ```bash
   journalctl -u docker
   ```
