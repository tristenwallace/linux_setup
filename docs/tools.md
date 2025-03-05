# Development Tools Installation Guide

## 1. Postman

```bash
# Install Postman using Snap
sudo snap install postman
```

**Post-installation setup:**

- Launch Postman
- Click the avatar in the top right corner
- Click "Add Account" to log in to your accounts via the browser

## 2. pgAdmin 4

### Repository Setup

```bash
# Install the public key
curl -fsS https://www.pgadmin.org/static/packages_pgadmin_org.pub | sudo gpg --dearmor -o /usr/share/keyrings/packages-pgadmin-org.gpg

# Create repository configuration
sudo sh -c 'echo "deb [signed-by=/usr/share/keyrings/packages-pgadmin-org.gpg] https://ftp.postgresql.org/pub/pgadmin/pgadmin4/apt/$(lsb_release -cs) pgadmin4 main" > /etc/apt/sources.list.d/pgadmin4.list && apt update'

# Install pgAdmin 4 (desktop version)
sudo apt install pgadmin4-desktop
```

## 3. Node.js and npm

### Using Node Version Manager (nvm)

```bash
# Install nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash

# Initialize nvm in current shell
\. "$HOME/.nvm/nvm.sh"

# Install Node.js v22
nvm install 22

# Verify installations
node -v  # Expected: v22.14.0
nvm current  # Expected: v22.14.0
npm -v   # Expected: 10.9.2
```
