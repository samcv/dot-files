#!/usr/bin/env perl6
$*IN.slurp(:close) ~~ /^$<head>=(.*)$<untracked>=("Untracked files:".*)/; print $<untracked> ~ $<head>
