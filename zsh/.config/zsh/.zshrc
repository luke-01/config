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

# prompt
eval "$(starship init zsh)"

# zoxide (better cd)
eval "$(zoxide init zsh)"
