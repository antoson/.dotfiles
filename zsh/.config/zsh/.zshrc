HISTFILE=$XDG_STATE_HOME/.zhistory
HISTSIZE=5000
SAVEHIST=5000
HISTDUP=erase

setopt appendhistory
setopt sharehistory
setopt incappendhistory
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

. "$HOME/.cargo/env"

# Case insensitive completion
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

# Aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias vim='nvim'
alias ncspot='flatpak run io.github.hrkfdn.ncspot'
alias rm='echo use trash!'

[ -f ./.fzf.zsh ] && source ./.fzf.zsh

# Zoxide
# For completions to work, the above line must be added after compinit is called.
# You may have to rebuild your completions cache by running rm ~/.zcompdump*; compinit.
eval "$(zoxide init zsh)"

# Starship.rs
eval "$(starship init zsh)"

source /home/ondra/.config/broot/launcher/bash/br
