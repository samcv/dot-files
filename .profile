local filename="$0"
debug_filename
# MPD daemon start (if no other user instance exists)
if cmd-in-path mpd; then
	[ ! -s ~/.config/mpd/pid ] && mpd
fi
if cmd-in-path ruby; then
	GEM_HOME=$(ruby -e 'print Gem.user_dir')
	export GEM_HOME
	local ruby_add_path=( "$(ruby -e 'print Gem.user_dir')/bin" "$HOME/.rvm/bin" )  # Add RVM to PATH for scripting
	add_array_to_path 'ruby_add_path'
	# Load RVM into a shell session *as a function*
	[ -s "$HOME/.rvm/scripts/rvm" ] && source "$HOME/.rvm/scripts/rvm"
fi
# Add ~/bin to path:
if [ -d "$HOME/bin" ]; then
	PATH="$HOME/bin:$PATH"
fi
# Add ~/git/diff-so-fancy to path:
local diff_path=( "$HOME/git/diff-so-fancy" )
add_array_to_path 'diff_path'

if [[ "$PROFILE_D_LOADED" ]]; then printf "Profile already loaded. Reloading though.\n"; fi
if [[ -d "$HOME/.profile.d" ]]; then
  for i in $HOME/.profile.d/*.sh; do
    if [ -r $i ]; then
      source $i
    fi
  done
  PROFILE_D_LOADED=1
  export PROFILE_D_LOADED
fi
distro_src_file="/home/samantha/.profile.d/distro/alias-$(uname -n).sh"
parse_file "$distro_src_file" "source"
TEST_JOBS=$((1 + $(nproc)))
export TEST_JOBS
export PATH
