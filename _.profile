# MPD daemon start (if no other user instance exists)
[ ! -s ~/.config/mpd/pid ] && mpd
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

#PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"
export GEM_HOME=$(ruby -e 'print Gem.user_dir')
# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
export GTK_IM_MODULE='xim'
#export XMODIFIERS="@im=none"
export QT_IM_MODULE='xim'
