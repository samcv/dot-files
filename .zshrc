#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#
source "$HOME/.functions.sh"
# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi
#autoload -Uz promptinit
 # promptinit
  #prompt fire theme
source "$HOME/.zshrc.local"
# Customize to your needs...
