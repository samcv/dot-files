# Set path to perl6 scriptdirs if they exist

[ -d  /usr/share/perl6/site/bin ] && PATH="$PATH:/usr/share/perl6/site/bin"
[ -d /usr/share/perl6/vendor/bin ] && PATH="$PATH:/usr/share/perl6/vendor/bin"
[ -d /usr/share/perl6/bin ] && PATH="$PATH:/usr/share/perl6/bin"

export PATH
