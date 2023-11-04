HISTFILE=$XDG_STATE_HOME/.zhistory
HISTSIZE=10000
SAVEHIST=10000
HISTDUP=erase

setopt appendhistory
setopt sharehistory
setopt incappendhistory
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups
setopt hist_ignore_space

# Emacs mode
bindkey -e

. "$HOME/.cargo/env"

zmodload zsh/complist
autoload -Uz compinit && compinit -d $XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION
_comp_options+=(globdots) # Include hidden files
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' # Case insensitive comp

# Vim motions for completion menu navigation
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char 

# Aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias vim='nvim'
alias week='date +%V'

[ -f ./.fzf.zsh ] && source ./.fzf.zsh

# Zoxide
# For completions to work, the above line must be added after compinit is called.
# You may have to rebuild your completions cache by running rm ~/.zcompdump*; compinit.
eval "$(zoxide init zsh)"

# Starship.rs
eval "$(starship init zsh)"

# Must be at the end
source "$HOME/.plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
