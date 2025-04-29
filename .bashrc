# If NOT an interactive shell, exit early
[[ $- != *i* ]] && return

# Inside NVIM (toggleterm or neovim terminal)?
if [[ -n "$NVIM" ]]; then
  # Running inside Neovim terminal
  # Load starship because we want the prompt pretty
  eval "$(starship init bash)"
  eval "$(zoxide init bash)"
  eval "$(atuin init bash --disable-up-arrow)"

  # Do NOT load ble.sh, because it breaks inside NVIM
else
  # Normal real terminal
  source "$HOME/.local/share/blesh/ble.sh" --rcfile "$HOME/.blerc"
  eval "$(starship init bash)"
  eval "$(zoxide init bash)"
  eval "$(atuin init bash --disable-up-arrow)"
fi

# Common exports
export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
export GPG_TTY=$(tty)
export PATH=$PATH:$HOME/go/bin:$HOME/.cargo/bin
eval "$(fzf --bash)"
