
if [[ $- == *i* ]]; then
  source "$HOME/.local/share/blesh/ble.sh" --rcfile "$HOME/.blerc"
fi

setxkbmap -option ctrl:nocaps

alias ll="ls -l"
alias la="ls -la"

alias g="git"
alias k="kubectl"

export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
export GPG_TTY=$(tty)

eval "$(starship init bash)"
eval "$(zoxide init bash)"

#[[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh
eval "$(atuin init bash --disable-up-arrow)"

[[ ! ${BLE_VERSION-} ]] || ble-attach
