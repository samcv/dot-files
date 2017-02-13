#!/usr/bin/env sh
# MPD daemon start (if no other user instance exists)
if [ -f /usr/bin/mpd ];then
	[ ! -s ~/.config/mpd/pid ] && mpd
fi
if [ -f /usr/bin/ruby ]; then
	export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
	#PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"
	GEM_HOME=$(ruby -e 'print Gem.user_dir')
	export GEM_HOME
	PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"
	# Load RVM into a shell session *as a function*
	[ -s "$HOME/.rvm/scripts/rvm" ] && . "$HOME/.rvm/scripts/rvm"
fi
# Add ~/bin to path:
if [ -d "$HOME/bin" ]; then
	PATH="$HOME/bin:$PATH"
fi
if [ "$GTK_IM_MODULE" = '' ]; then
	export GTK_IM_MODULE='xim'
fi
if [ "$QT_IM_MODULE" = '' ]; then
	export QT_IM_MODULE='xim'
fi
#export XMODIFIERS="@im=none"

#export PATH="$PATH:/home/samantha/git/rakudo/install/bin:/home/samantha/git/rakudo/install/share/perl6/site/bin"
#export perl6='/home/samantha/git/rakudo/install/bin/perl6'
if [ -f ~/.rakudobrew/bin/rakudobrew ]; then
	eval "$(/home/samantha/.rakudobrew/bin/rakudobrew init -)"
fi
PERL6_DIR="$HOME/perl6/bin"
#PERL6_DIR="$HOME/.rakudobrew/moar-blead-nom/install/share/perl6/site/bin"
if [ -d "$PERL6_DIR" ]; then
	export PATH="$PATH:$PERL6_DIR"
	export PATH="$HOME/perl6/share/perl6/site/bin:$PATH"
fi
