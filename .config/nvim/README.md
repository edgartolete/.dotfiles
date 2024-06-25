# Installation

## Install Neovim
Reference: https://github.com/neovim/neovim/blob/master/INSTALL.md#install-from-package
```sh
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz
```
Note: make sure you dont have existing neovim installed in your computer from different package managers.

After this step add this to ~/.bashrc if you are using bash or ~/.zshrc if you are using zsh:

```sh
export PATH="$PATH:/opt/nvim-linux64/bin"
```

Update your bash
```sh
source ~/.bashrc
```
or Update your zsh
```shell
source ~/.zshrc
```

Note: There are other ways to install. Reference: https://github.com/neovim/neovim/blob/master/INSTALL.md

## Clone this Template

(Situational): If you have files inside nvim delete all using below commands. Below will delete all the files)
Remove all files if there is.

```sh
rm -rf ~/.config/nvim/*
```

Remove dot files if there is.

```sh
rm -rf ~/.config/nvim/.
```

Remove .git folder if there is.

```sh
rm -rf ~/.config/nvim/.git
```

Clone Repository to your nvim folder.

```sh
git clone https://github.com/edgartolete/nvim-setup ~/.config/nvim
```

if you dont dont have this folder create it using below command

```sh
mkdir ~/.config/nvim
```
## Install Dependencies

**ripgrep**. ripgrep is a line-oriented search tool that recursively searches the current directory for a regex pattern.

```sh
sudo apt install ripgrep
```

If you dont have nodejs install. Please install it first, https://nodejs.org/en/download/package-manager

[Language Server Protocol](https://github.com/Microsoft/language-server-protocol) implementation for TypeScript wrapping tsserver. NodeJS required

```sh
sudo npm i -g typescript-language-server
```

Prettier for formatting. NodeJS required.

```sh
sudo npm i -g prettier
```

Vue Language server
```shell
sudo npm i -g vls
```

`gopls` Golang LSP. If Mason Package Manager cannot install this dependency. You can install it manually using machine package manager. Below is for ubuntu. Run `sudo apt update` first.
```sh
sudo apt -y install gopls
```
If Mason failed to install jdtls. Install it with brew
```shell
brew install jdtls
```


Install LazyGit for Ubuntu
Reference: https://github.com/jesseduffield/lazygit?tab=readme-ov-file#installation
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

Install Nerd Fonts. Find fonts you like from https://www.nerdfonts.com/font-downloads. Below example is for Fira Code Nerd Font.
```shell
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/FiraCode.zip
```

extract it.
```shell
sudo unzip file_to_extract.zip -d /usr/share/fonts
```
and
```shell
sudo unzip file_to_extract.zip -d ~/.local/share/fonts/
```
if you dont have `unzip`. install it using your machine package manager, e.g, `sudo apt install uzip` if you are using debian/linux.


## Plugins Installed

-   telescope.nvim - "Fuzzy Finder"
-   neo-tree.nvim - "File tree viewer"
-   fugitive - "Fugitive is the premier Vim plugin for Git"
-   nvim-cmp - "auto suggest"
-   mason - "LSP plugin manager, allows you to install and manage LSPs"
-   harpoon - "allows you to mark a file as jump list and persist after exit."
-   cmp-tabnine - "Auto suggest using TabNine to automatically complete codes"
-   tokyonight.nvim - "Editor color scheme"
-   which-key.nvim - "show hints what key next to press"
-   nvim-numbertoggle - "Show line numbers to jump on normal mode"
-   prettier.nvim - "Properly align codes based on configuration"
-   tailwind-tool.nvim - "autosuggest for tailwind"
-   Comment.nvim - "Short keys to comment a line or block of codes"
-   nvim-autopairs - "Automatically create character pairs"
-   lorem - "Add dummy text"
-   spectre - "Find and Replace"
-   lazygit - "Integration with LazyGit cli to manage git"
-   treesj - "Toggle Code node/block"
-   aerial - "Show code outline"
-   gitsigns - "Super fast git decorations implemented purely in Lua."
-   bookmarks - "A Bookmarks Plugin With Global File Store For Neovim Written In Lua." 
-   trouble - "A pretty list for showing diagnostics, references, quickfix list",
-   todo-comment - "to highlight and search for todo comments like TODO, HACK, BUG in your code base."


# Troubleshoot

## nvim-java doesn't seem to work with mason. gettings errors.
Follow instruction: https://github.com/nvim-java/nvim-java/wiki/Q-&-A#no_entry-cannot-find-package-xxxxx
