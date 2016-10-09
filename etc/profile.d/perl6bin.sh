# Set path to perl6 scriptdirs if they exist

#[ -d /usr/bin/site_perl ] && PATH=$PATH:/usr/bin/site_perl
[ -d  /usr/share/perl6/site/bin ] && PATH=$PATH:/usr/share/perl6/site/bin

[ -d /usr/share/perl6/vendor/bin ] && PATH=$PATH:/usr/share/perl6/vendor/bin
[ -d /usr/share/perl6/bin ] && PATH=$PATH:/usr/share/perl6/bin

#[ -d /usr/bin/core_perl ] && PATH=$PATH:/usr/bin/core_perl

export PATH

# If you have modules in non-standard directories you can add them here.
#export PERLLIB=dir1:dir2

