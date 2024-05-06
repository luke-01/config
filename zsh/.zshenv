# XDG Base Directory
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.local/cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

# Zsh config directory
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export HISTFILE="$ZDOTDIR/history"
export HISTSIZE=10000
export SAVEHIST=10000

# text editor
export EDITOR="nvim"
export VISUAL="nvim"

# use vim to view manpages
export MANPAGER="nvim +Man!"

# texlive installer stuff
export MANPATH="/usr/local/texlive/2024/texmf-dist/doc/man:${MANPATH}"
export INFOPATH="/usr/local/texlive/2024/texmf-dist/doc/info:${INFOPATH}"
export PATH="${PATH}:/usr/local/texlive/2024/bin/x86_64-linux"
