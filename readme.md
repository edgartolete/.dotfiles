# Work Environment Setup

## Prerequisites
Need to have git installed and others to setup. If you dont have git yet, run below command for Debian/ubuntu

Update Package Information and Upgrading Packages
```shell
sudo apt update && sudo apt upgrade
```

Install minimal packages
```shell
apt install -y git curl wget zsh build-essential procps file unzip gnome-terminal ca-certificates stow ripgrep openssh-server
```
 - git. For version control
 - curl. For http request most packages required
 - wget. For downloading files from url
 - unzip. For compress and extracting compressed files
 - stow. For setting up links from out .dotfiles
 - ripgrep. Used by neovim and helix for file searching
 - openssh-server. For remove server connection

Also make sure you have generated ssh.
If you dont have yet, follow this instruction: https://github.com/edgartolete/swe-notes/blob/main/23.%20Linux.md#ssh

## Cloning repository
Clone this repository to your `~/.dotfiles` folder. You can use http or better ssh
```shell
git clone git@github.com:edgartolete/dotfiles.git ~/.dotfiles
```

Go inside your `.dotfiles` folder then run. Please note the dot (.) means stow the current directory
```shell
stow . 
```

## Nerd Fonts
Install Nerd Fonts for Enhanced Visual Appearance, Better Symbol Support, Better Symbol Support, Compatibility with Various Tools

Reference: 
 - https://www.nerdfonts.com/font-downloads
 - https://linuxconfig.org/how-to-install-and-manage-fonts-on-linux

Download the zipfile (Fira Mono)
```shell
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/FiraMono.zip
```

Unzip the file to local fonts directory and overwrite existing files
```shell
unzip -o FiraMono.zip -d ~/.local/share/fonts
```

```shell
sudo unzip FiraMono.zip -d /usr/share/fonts
```

Let system scan the fonts directory
```share
 fc-cache -v -f /usr/share/fonts
```

You can now then select fonts from the shell preferences.

## Homebrew
Homebrew is a package manager compatible with Mac and Linux

Installation: https://brew.sh/
Linux Additional Instruction: https://docs.brew.sh/Homebrew-on-Linux#install

To Install
```shell
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```
Additional instruction will show after the initial install

LSP for java
```shell
brew install jdtls
```

LSP for golang
```shell
brew install gopls
```

## zsh
Shell terminal for better experience. To install, run below
```shell
apt install zsh
```


(Optional): Set zsh as default shell
```shell
chsh -s $(which zsh)
```

## nvm
nvm is a package manager for nodejs. to install node. run below command command with version number e.g, 18
```shell
nvm install <version_number>
```

Install global packages. NOTE! you need to install this for every nodejs versions you have.
```shell
npm i -g yarn vscode-langservers-extracted @tailwindcss/language-server typescript typescript-language-server @vue/language-server @microsoft/compose-language-service dockerfile-language-server-nodejs 
```

(Not applicable): To set default global install directory 
```shell
npm config --global set prefix ~/.config/npm
```

(Not applicable): To set default global cache directory
```shell
npm config --global set cache ~/.config/npm-cache
```

(Not applicable): to check your current npm global directory
```shell
npm config get prefix
```

## tmux
Shell Tiling manager
```shell
brew install tmux
```

Install plugin manager
```shell
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

## vim
CLI text editor version 9
```shell
brew install vim
```


## neovim
CLI text editor

### Install using brew
```shell
brew install neovim
```

### Install from binary 
Reference: https://github.com/neovim/neovim/blob/master/INSTALL.md#install-from-package
```shell
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz
```

Note: make sure you dont have existing neovim installed in your computer from different package managers.

After this step add this to ~/.bashrc if you are using bash or ~/.zshrc if you are using zsh:

```shell
export PATH="$PATH:/opt/nvim-linux64/bin"
```
Update your bash or zsh
```shell
source ~/.zshrc
```

If you dont have nodejs install. Please install it first, https://nodejs.org/en/download/package-manager

Language Server Protocol implementation for TypeScript wrapping tsserver. NodeJS required

```shell
npm i -g typescript typescript-language-server
```

```shell
Prettier for formatting. NodeJS required.
```

```shell
 npm i -g prettier
```

Vue Language server
```shell
 npm i -g vls
```

gopls Golang LSP. If Mason Package Manager cannot install this dependency. You can install it manually using machine package manager. Below is for ubuntu. Run sudo apt update first.

NOTE: if install from Brew did not work, you can use below instead.
```shell
sudo apt -y install gopls
```

## helix
CLI text editor
```shell
brew install helix
```

Themes: https://github-wiki-see.page/m/helix-editor/helix/wiki/Themes

LSPs: https://github.com/helix-editor/helix/wiki/Language-Server-Configurations


## fzf
Fuzy finder
```shell
brew install fzf
```

## yazi
Files Explorer
```shell
jdtls
```

## Golang
```shell
brew install go
```

LSPs:
```shell
go install golang.org/x/tools/gopls@latest          # LSP
go install github.com/go-delve/delve/cmd/dlv@latest # Debugger
go install golang.org/x/tools/cmd/goimports@latest  # Formatter
```

## Lazygit
Git Manager

### Install using Brew
```shell
brew install lazygit
```

### Install from Binary
Install LazyGit for Ubuntu Reference: https://github.com/jesseduffield/lazygit?tab=readme-ov-file#installation

```shell
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin

```

to verify installation
```shell
lazygit --version
```

## Docker
Reference: https://docs.docker.com/desktop/install/linux-install/

Reference: https://docs.docker.com/engine/install/debian/#install-using-the-repository

Set up Docker's apt repository.
```sh
# Add Docker's official GPG key:
sudo apt-get update
sudo apt-get install ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update
```

To install the latest version, run:
```sh
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin docker-compose
```

Verify that the installation is successful by running the hello-world image:
```sh
sudo service docker start
```

```sh
sudo docker run hello-world
```

```sh
service docker status
```

## Lazydocker
Docker Manager
```shell
brew install lazydocker
```
