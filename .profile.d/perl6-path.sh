local filename="$0"
debug_filename
local p6path="$HOME/perl6"
local p6_path_array=( "${p6path}/bin" "${p6path}/share/perl6/site/bin" )
add_array_to_path p6_path_array
export PATH

#PERL6_DIR="$HOME/.rakudobrew/moar-blead-nom/install/share/perl6/site/bin"
#export PATH="$PATH:/home/samantha/git/rakudo/install/bin:/home/samantha/git/rakudo/install/share/perl6/site/bin"
#export perl6='/home/samantha/git/rakudo/install/bin/perl6'
#if [ -f ~/.rakudobrew/bin/rakudobrew ]; then
#	eval "$(/home/samantha/.rakudobrew/bin/rakudobrew init -)"
#fi
