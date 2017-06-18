local filename="$0"
debug_filename
export SUDO_EDITOR='kate -n'
[[ ! -d "$HOME/.config/rlwrap" ]] && mkdir -p "$HOME/.config/rlwrap"
export RLWRAP_HOME="$HOME/.config/rlwrap"
