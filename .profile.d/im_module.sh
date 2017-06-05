local filename="$0"
debug_filename
export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus
#if [ "$GTK_IM_MODULE" = '' ]; then
	#export GTK_IM_MODULE='xim'
#fi
#if [ "$QT_IM_MODULE" = '' ]; then
	#export QT_IM_MODULE='xim'
#fi
#export XMODIFIERS="@im=none"
