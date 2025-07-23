# 🛠️ NHS Dotfiles

[![CI/CD Pipeline](https://github.com/nhs-england-tools/dotfiles/actions/workflows/cicd-pipeline.yaml/badge.svg)](https://github.com/nhs-england-tools/dotfiles/actions/workflows/cicd-pipeline.yaml)
[![Quality Gate](https://sonarcloud.io/api/project_badges/measure?project=nhs-england-tools_dotfiles&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=nhs-england-tools_dotfiles)
[![Platform Support](https://img.shields.io/badge/Platform-macOS%20%7C%20Linux%20%7C%20WSL-brightgreen.svg)](README.md)
[![MIT Licence](https://img.shields.io/badge/License-MIT-blue.svg)](LICENCE.md)

This repository contains a curated and version-controlled set of configuration files (dotfiles) aimed at establishing a secure, consistent, and productive development environment. It is designed with NHS engineers in mind but can be reused or adapted by any individual or team who wants to bootstrap their development setup across macOS, Linux, and Windows Subsystem for Linux (WSL).

Dotfiles are hidden files that define preferences and behaviours for tools like terminals, shells, editors, and system utilities. Managing them centrally helps reduce setup time, ensures consistency, and enables portability of developer environments.

This setup is optimised for [Developer Experience (DX)](https://www.thoughtworks.com/en-gb/insights/blog/why-you-should-invest-good-developer-experience-today) and is aligned with an [Internal Developer Platform (IDP)](https://www.thoughtworks.com/en-gb/insights/blog/devops/better-developer-platforms-key-better-digital-products) model, supporting NHS’ broader software delivery strategy.

Refer to the _[Unofficial guide to dotfiles on GitHub](https://dotfiles.github.io/)_ for general dotfiles background.

## Table of Contents

- [🛠️ NHS Dotfiles](#️-nhs-dotfiles)
  - [Table of Contents](#table-of-contents)
  - [💼 Who Is This For?](#-who-is-this-for)
  - [📃 What's Included?](#-whats-included)
  - [🚀 Quick Start](#-quick-start)
  - [⚙️ Prerequisites](#️-prerequisites)
    - [💻 System Requirements](#-system-requirements)
    - [🔐 Required Permissions](#-required-permissions)
  - [📦 Installation](#-installation)
    - [🗃 Archive Your Home Directory](#-archive-your-home-directory)
    - [🔧 Apply New Configuration](#-apply-new-configuration)
    - [🔑 Set Up a Password Manager](#-set-up-a-password-manager)
    - [🔁 Re-run the Setup Locally](#-re-run-the-setup-locally)
  - [📁 Structure](#-structure)
    - [Example: Downstream Fork](#example-downstream-fork)
  - [✨ Features](#-features)
    - [🐚 Shell Environment](#-shell-environment)
    - [💻 Development Tools](#-development-tools)
    - [🔒 Security](#-security)
    - [🖥️ Cross-Platform Support](#️-cross-platform-support)
  - [💡 Usage](#-usage)
    - [🧬 Keep Your Repository Up to Date](#-keep-your-repository-up-to-date)
    - [📤 Raise a Pull Request Back to the Upstream Repository](#-raise-a-pull-request-back-to-the-upstream-repository)
  - [🧰 Configuration](#-configuration)
    - [🔧 Template Variables](#-template-variables)
    - [✏️ Common Customisations](#️-common-customisations)
  - [📚 Documentation](#-documentation)
    - [🧭 Setup Guides](#-setup-guides)
    - [🔧 Tool Guides](#-tool-guides)
    - [🖥️ Platform Guides](#️-platform-guides)
  - [🛠 Troubleshooting](#-troubleshooting)
    - [🚨 Common Issues](#-common-issues)
  - [📎 Resources](#-resources)
  - [🤝 Contributing](#-contributing)
  - [📬 Contacts](#-contacts)
  - [📄 Licence](#-licence)

## 💼 Who Is This For?

This project is for NHS engineers, digital teams, and contributors who want a fast, reliable, and secure way to configure their development environment. It supports cross-platform setups and includes preconfigured support for common engineering tools.

## 📃 What's Included?

- Shell environment (Zsh and Bash) with themes, prompts, aliases, and completions
- Git and GitHub configuration with commit signing support
- Visual Studio Code preferences and recommended extensions
- Secrets integration using Bitwarden
- Platform-specific defaults for macOS, Ubuntu, and WSL
- Secure, opinionated defaults for improved security and compliance

## 🚀 Quick Start

```shell
# Install chezmoi and apply NHS dotfiles in one step
bash -c "$(curl -fsLS get.chezmoi.io)" -- init --apply --branch custom "stefaniuk"
```

For detailed setup and configuration options, see the [Installation](./#installation) section.

## ⚙️ Prerequisites

Before installing this dotfiles configuration, ensure you have the following:

### 💻 System Requirements

- macOS 10.15+, Ubuntu 20.04+, or Windows 10+ with WSL2
- Git 2.28 or newer
- Zsh shell
- Terminal with Unicode and true color support

### 🔐 Required Permissions

- Administrator access (for system package installation)
- Permission to modify shell configuration
- SSH key configured for GitHub access

## 📦 Installation

This dotfiles repository is configured and managed by the `chezmoi` project. [chezmoi](https://www.chezmoi.io/), pronounced _/ʃeɪ mwa/ (shay-moi)_ is currently the [most complete and most hackable](https://www.chezmoi.io/comparison-table/) dotfiles manager out there.

### 🗃 Archive Your Home Directory

Prior to applying any changes to your home directory, create a backup of your current configuration. This command creates an archive file in the temporary directory that can be used later to restore the configuration, if needed.

```shell
tar -czvf /tmp/home-directory-backup.tar.gz -C ~ .
```

Depending on your OS and terminal settings, you may be prompted to grant access permissions during backup. This is expected and ensures all relevant configuration files are captured. However, if the above takes too long as it archives all the files in your home directory an alternative would be to use `chezmoi` to backup only the dotfiles. Please follow the [installation guide](https://www.chezmoi.io/install/#one-line-package-install) specific to your operating system before proceeding.

Backups may include sensitive files. Ensure you store them securely if transferring between machines.

```shell
chezmoi archive --output=/tmp/dotfiles-backup.tar.gz
```

### 🔧 Apply New Configuration

The following instruction clones the [dotfiles](https://github.com/stefaniuk/dotfiles) repository into the `~/.local/share/chezmoi/` directory and next applies changes accordingly, to your home directory `~/`. During the setup it prompts you to provide configuration options like Git committer name and email address, etc.

```shell
bash -c "$(curl -fsLS get.chezmoi.io)" -- init --apply --branch custom "stefaniuk"
```

For detailed information about `chezmoi` configuration and usage, see the [Chezmoi usage guide](./docs/guides/chezmoi-usage.md).

### 🔑 Set Up a Password Manager

To store some of the configuration options, `chezmoi` can use a password manager. Therefore, after the dotfiles installation, please follow the [Bitwarden setup](./docs/guides/bitwarden-usage.md) guide to improve the installation experience for any subsequent run.

### 🔁 Re-run the Setup Locally

Here’s a complete instruction set to re-apply your dotfiles manually after the initial installation using chezmoi:

```shell
# Navigate to your chezmoi working directory (optional, for context)
cd ~/.local/share/chezmoi

# Pull the latest changes from your dotfiles source repo
chezmoi update

# Or, re-apply everything from your local configuration
chezmoi apply
```

If you’ve made changes to your `chezmoi.toml` or templates, or switched branches, you can also re-initialise:

```shell
# Re-initialise from your fork (e.g. after switching branches or repos)
chezmoi init --apply git@github.com:<your-username>/dotfiles.git
```

You can simulate the changes that would be applied without making them using:

```shell
chezmoi diff
```

To only re-apply a specific file (e.g. .zshrc):

```shell
chezmoi apply ~/.zshrc
```

## 📁 Structure

This project manages files like:

```shell
~ ($HOME)
│
├─── .aliases
├─── .bash_profile
├─── .bash_prompt
├─── .bashrc
├─── .exports
├─── .functions
├─── .gitattribute
├─── .gitconfig
├─── .gitignore
├─── .gitmessage
├─── [.macos|.ubuntu]
├─── .p10k.zsh
├─── .path
└─── .zshrc
```

Some changes use imperative (non-declarative) scripts, written to be idempotent and applied only when necessary.

You can fork this project to customise it for your own environment and workflow.

### Example: Downstream Fork

For a practical example of how this repository can be forked and customised, see [stefaniuk/dotfiles](https://github.com/stefaniuk/dotfiles/), which is a downstream fork maintained and configured by the author. This example demonstrates how to adapt the NHS dotfiles for personal use, apply local preferences, and keep in sync with upstream changes.

## ✨ Features

### 🐚 Shell Environment

- ⚡ [Oh My Zsh](https://ohmyz.sh/) with Powerlevel10k theme
- 🔁 Productivity aliases and functions
- 🌍 Environment variables management
- 🧩 Custom prompts and autocompletions
- 🛠 [GNU-compatible CLI tools](https://en.wikipedia.org/wiki/List_of_GNU_packages) for consistent experience across supported operating systems

### 💻 Development Tools

- 📝 [Visual Studio Code](https://code.visualstudio.com/) as default editor
  - 🎛 Custom settings and keybindings
  - 🧩 Recommended extensions
- 🔧 Git configuration
  - 🔐 Signed commits
  - 🗃 OS-specific ignore rules
  - 🚀 Git aliases and branch helpers
- 🧪 Toolchain support
  - 🟨 TypeScript (JavaScript ecosystem), Node.js, npm
  - 🐍 Python, pip, uv
  - 🐳 Containers integration

### 🔒 Security

- ✍️ GPG commit signing
- 🔐 SSH key management
- 🧰 Bitwarden password integration
- 🧱 Secure-by-default settings

### 🖥️ Cross-Platform Support

- 🍏 macOS
- 🐧 Linux/Ubuntu
- 🪟 Windows WSL _(coming soon)_
- ☁️ GitHub Codespaces

## 💡 Usage

### 🧬 Keep Your Repository Up to Date

To maintain your own customisations while regularly synchronising with upstream updates, it’s recommended to create a separate branch, commonly called `custom`. This approach keeps your local changes isolated from the main branch, makes updates easier to manage, and helps you avoid conflicts.

```shell
# Clone your fork of the dotfiles repository
git clone git@github.com:<your-username>/dotfiles.git
cd dotfiles
git checkout main

# Create and switch to your persistent custom branch, if it doesn't exist yet
git checkout custom || git checkout -b custom

# For each set of changes, create a feature branch from custom
git checkout -b your-custom-branch
# Make your custom changes ...
git add .
git commit -S -m "Short, descriptive summary of your custom changes"
git push origin your-custom-branch

# Open a pull request on GitHub and merge your feature branch into custom ...

# After merging on GitHub, clean up local and remote feature branches
git checkout custom
git pull origin custom
git branch -D your-custom-branch
git push origin --delete your-custom-branch

# Periodically update your fork with the latest changes from upstream
git checkout main
git fetch upstream
git merge upstream/main
git push origin main

# Rebase your custom branch onto the updated main branch
git checkout custom
git rebase main
git push origin custom --force-with-lease

# (Optional) Squash your custom branch to a single commit
git checkout custom
git reset --soft $(git merge-base custom main)
git add .
git commit -S -m "Squashed: All custom changes up to $(date +"%A, %d %B %Y, %H:%M:%S %Z")"
git push origin custom --force-with-lease
```

This method preserves a clean history, keeps your changes separate, and makes future updates straightforward.

While it is possible to keep all your changes on the `main` branch, doing so means you will need to manually resolve any conflicts each time you pull updates from the original repository. This can become complicated, especially as more changes are made both locally and upstream. For most users, using a dedicated `custom` branch is simpler, safer, and helps avoid these issues.

### 📤 Raise a Pull Request Back to the Upstream Repository

To contribute improvements, features, or fixes to the upstream repository, follow the standard GitHub workflow:

```shell
# Ensure your local repository has the latest changes from upstream
git fetch upstream
git checkout upstream/main

# Create a new feature branch based on the latest upstream/main
git checkout -b your-contribution-branch

# Make your changes ..., then stage and sign your commit
git add .
git commit -S -m "Short, descriptive summary of your contribution"

# Push your contribution branch to your fork on GitHub
git push origin your-contribution-branch

# Open a pull request on GitHub ...
# - Set your fork and feature branch as the source
# - Set the upstream repository and its main branch as the target
# - Add a clear title and description for reviewers

# After your pull request is merged on GitHub, you can safely delete the local branch
git checkout main
git pull origin main
git branch -D your-contribution-branch

# Next, follow the "Keep Your Repository Up to Date" section to update your branches with any new upstream changes
```

Your contribution will be reviewed by maintainers and, if accepted, merged into the official repository for others to benefit from.

## 🧰 Configuration

### 🔧 Template Variables

After installation, Chezmoi will generate a configuration file at `~/.config/chezmoi/chezmoi.toml`. You can customise it to personalise your dotfiles setup with variables such as:

- `dotfiles.name` - Your full name
- `dotfiles.email` - Your email address
- `dotfiles.git_signingkey` - GPG key ID for commit signing

### ✏️ Common Customisations

Edit tracked config files:

```shell
chezmoi edit ~/.gitconfig
```

## 📚 Documentation

Comprehensive guides are available for various aspects of this dotfiles setup:

### 🧭 Setup Guides

- 🏗 [Chezmoi Usage](./docs/guides/chezmoi-usage.md) - Dotfiles manager setup and usage
- 🔐 [Bitwarden Usage](./docs/guides/bitwarden-usage.md) - Password manager integration

### 🔧 Tool Guides

- 🌀 [Git Usage](./docs/guides/git-usage.md) - Version control setup and workflows
- 🐳 [Containers Usage](./docs/guides/containers-usage.md) - Container management
- 💻 [Visual Studio Code Usage](./docs/guides/vscode-usage.md) - Editor configuration

### 🖥️ Platform Guides

- ⚙️ [System Usage](./docs/guides/system-usage.md) - General system configuration
- 🧮 [Terminal Usage](./docs/guides/terminal-usage.md) - Terminal setup and customization

## 🛠 Troubleshooting

### 🚨 Common Issues

1. **GPG signing issues**

    ```shell
    # Verify GPG key setup
    gpg --list-secret-keys --keyid-format LONG
    ```

2. **Zsh configuration problems**

    ```shell
    # Reset Zsh configuration
    chezmoi apply ~/.zshrc
    ```

## 📎 Resources

The longstanding [mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles) project, with its well-established practices and features, has served as an inspiration for improving the Developer Experience in NHS England. It has been adapted and revamped to align with the organisation's strategy.

## 🤝 Contributing

We welcome contributions to improve and extend this project. Please follow the standard GitHub flow (fork → branch → pull request), and ensure your commits are signed.

For larger changes, open a discussion or issue first to align on the approach.

## 📬 Contacts

- [👤 Dan Stefaniuk](https://github.com/stefaniuk)

## 📄 Licence

> The [LICENCE.md](./LICENCE.md) file will need to be updated with the correct year and owner

Unless stated otherwise, this codebase is licensed under the MIT Licence, which applies to both the source code and any sample code within the documentation.

All HTML or Markdown documentation is [© Crown Copyright](https://www.nationalarchives.gov.uk/information-management/re-using-public-sector-information/uk-government-licensing-framework/crown-copyright/) and available under the terms of the [Open Government Licence v3.0](https://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/).
