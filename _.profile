# MPD daemon start (if no other user instance exists)
if [ -f /usr/bin/mpd ];then
	[ ! -s ~/.config/mpd/pid ] && mpd
fi
if [ -f /usr/bin/ruby ]; then
	export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
	#PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"
	export GEM_HOME=$(ruby -e 'print Gem.user_dir')
	PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"
	# Load RVM into a shell session *as a function*
	[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
fi
#export GTK_IM_MODULE='xim'
#export XMODIFIERS="@im=none"
#export QT_IM_MODULE='xim'

