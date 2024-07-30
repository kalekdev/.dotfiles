# Persist history and share between active shells
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=1000
setopt SHARE_HISTORY

# Initialise pure prompt
# Warning: Do not enable the vi-mode or virtualenv zsh plugins (incompatible)
fpath+=($HOME/.zsh/pure)
autoload -U promptinit; promptinit
prompt pure

# Case-insensitive autocomplete
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Used for managing dotfiles repo: https://www.atlassian.com/git/tutorials/dotfiles
alias config="/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME"

# Neovim aliases
alias v="nvim"
alias vi="nvim"
alias vim="nvim"
export EDITOR=nvim

# Electron flags
alias code="code --enable-features=UseOzonePlatform --ozone-platform=wayland"
alias compass="mongodb-compass --ignore-additional-command-line-flags --ozone-platform-hint=auto"

alias spotify="spotify_player"

# Vim mode
bindkey -v
bindkey ^R history-incremental-search-backward

# Add Go to PATH
export PATH=$PATH:/usr/local/go/bin
export PATH="$PATH:$(go env GOPATH)/bin"

# Add cargo to path
export PATH=$PATH:~/.cargo/bin/

# Added by NVM - MUST BE THE LAST MODIFICATION TO PATH
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
