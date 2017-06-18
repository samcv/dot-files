#!/usr/bin/env perl6
my $out = $*IN.slurp(:close);
$out ~~ /^$<head>=(.*)$<untracked>=("Untracked files:".*)/;
print $<untracked>.defined || $<head>.defined.not ?? $out !! ($<untracked> ~ $<head>);
