# Git and GitHub SSH Setup Guide

This guide will walk you through setting up Git and configuring SSH access for GitHub on your Linux machine.

## Installing Git

1.Update your package list:

```bash
sudo apt update
```

2.Install Git:

```bash
sudo apt install git
```

3.Verify the installation:

```bash
git --version
```

## Configuring Git

1.Set your global Git configuration:

```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
```

2.Set default branch name to main:

```bash
git config --global init.defaultBranch main
```

## Setting up SSH for GitHub

1.Generate a new SSH key:

```bash
ssh-keygen -t ed25519 -C "your.email@example.com"
```

- Press Enter to accept the default file location
- Enter a secure passphrase when prompted

2.Start the SSH agent:

```bash
eval "$(ssh-agent -s)"
```

3.Add your SSH key to the agent:

```bash
ssh-add ~/.ssh/id_ed25519
```

4.Copy your SSH public key:

```bash
cat ~/.ssh/id_ed25519.pub
```

5.Add the SSH key to your GitHub account:

- Go to GitHub.com
- Click your profile photo → Settings
- Click "SSH and GPG keys" → "New SSH key"
- Give your key a descriptive title
- Paste your key into the "Key" field
- Click "Add SSH key"

6.Test your SSH connection:

```bash
ssh -T git@github.com
```

## Optional Git Configurations

1.Set up Git credentials caching:

```bash
git config --global credential.helper cache
```

2.Configure default editor (if you prefer VSCode):

```bash
git config --global core.editor "code --wait"
```

3.Set up useful Git aliases:

```bash
git config --global alias.st status
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.cm commit
git config --global alias.lg "log --oneline --decorate --graph"
```

## Troubleshooting

If you encounter permission issues:

```bash
chmod 700 ~/.ssh
chmod 600 ~/.ssh/id_ed25519
chmod 644 ~/.ssh/id_ed25519.pub
```

For more information, refer to [GitHub's official documentation](https://docs.github.com/en/authentication/connecting-to-github-with-ssh)