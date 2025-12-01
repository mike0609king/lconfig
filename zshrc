# History
HISTSIZE=10000
SAVEHIST=10000

# Basic auto/tab complete
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files

# Use vim keys in tab complete menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# Makes it possible to use vi in the editor
bindkey -v
export KEYTIMEOUT=1

# getting utf-8 (languague environment)
export LANG="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

export nvimPath="nvim -u ~/lconfig/nvim/config.lua"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else # local
  export EDITOR=$nvimPath
fi

fpath+=${ZDOTDIR:-~}/.zsh_functions
TERMINAL=alacritty

export LS_COLORS="$LS_COLORS:ow=1;34:tw=1;34:"

##################################################
###      Other: At start of bash               ###
##################################################

# Changing keybinding
setxkbmap -option caps:escape
export PATH=~/.local/bin:~/bin:/usr/local/bin:$PATH

##################################################
###                Aliases                     ###
##################################################

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
#alias serve='browser-sync start --server --files . --no-notify -- host `hostname -I` --port 9000'

alias tmux='tmux -u -f ~/lconfig/tmux.conf'
alias nvim=$nvimPath

export CALCURSE_EDITOR=$vimPath

alias f='fzf | xclip -selection clipboard'
