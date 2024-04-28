autoload -U compinit && compinit

alias ls="eza"
alias la="eza -a"
alias ll="eza -la"
alias cd="z"

# plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# setup rust
. "$HOME/.cargo/env"

# setup vulkan
source /opt/vulkan/1.3.280.1/setup-env.sh

# # prompt
# eval "$(starship init zsh)"

export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
source $ZDOTDIR/git-prompt.sh

setopt PROMPT_SUBST
PS1='%B%F{red}%m%f %F{green}%1~%f%F{magenta}$(__git_ps1 " (%s)")%f%F{cyan} %f%b '

# zoxide (better cd)
eval "$(zoxide init zsh)"
