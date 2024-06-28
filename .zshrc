# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.

# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
#   source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

# INSURE INSTALLED HOMEBREW
if [[ -f "/opt/homebrew/bin/brew" ]] then
  eval "$(/opt/homebrew/bin/brew shellenv)" # If you're using Linux, you'll want this enabled
fi

if [[ -f "/home/linuxbrew/.linuxbrew/bin/brew" ]] then
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)" # If you're using macOS, you'll want this enabled
fi

# if [ "$TERM_PROGRAM" != "Apple_Terminal" ]; then
#   eval "$(oh-my-posh init zsh)"
# fi
#
# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in Powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit
compinit

zinit cdreplay -q

#Golang
export PATH="$HOME/.local/bin:$PATH"
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go
export GOROOT=/usr/local/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOPATH
export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:~/go/bin

# NPM set new path
export PATH="$HOME/.config/npm/bin:$PATH"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export PATH="$PATH:/opt/nvim-linux64/bin"

# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

lzn()
{
    export LAZYNPM_NEW_DIR_FILE=~/.lazynpm/newdir

    lazynpm "$@"

    if [ -f $LAZYNPM_NEW_DIR_FILE ]; then
            cd "$(cat $LAZYNPM_NEW_DIR_FILE)"
            rm -f $LAZYNPM_NEW_DIR_FILE > /dev/null
    fi
}

#HISTORY
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_find_no_dups
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Shell integrations
# source <(fzf --zsh)

#ALIASES
alias ls='ls --color'
alias c='clear'
alias dr1='docker run --name pse_analyzer -d -p 80:3000 -v $(pwd):/pse_analyzer --network 32695717995b --env-file ./.env.local pse_analyzer:0.0.0'
alias drs='docker run --name api-dev -d -p 8080:8080 -e NODE_ENV=development --restart=always -v $(pwd):/api --network e7fcbba7893f edgartolete/5ma4s:0.1.1'
alias drs='docker run --name api-dev -d -p 8080:8080 -e NODE_ENV=development --restart=always -v $(pwd):/api --network e7fcbba7893f edgartolete/5ma4s:0.1.1'

hx(){
  if [[ "$1" == "" ]]; then
    command hx .
  else
    command hx $1
  fi
}

# . /home/linuxbrew/.linuxbrew/opt/asdf/libexec/asdf.sh

#Node Version Manager
export NVM_DIR="$HOME/.nvm"
  [ -s "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh" ] && \. "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/home/linuxbrew/.linuxbrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/home/linuxbrew/.linuxbrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
