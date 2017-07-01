#!/usr/bin/env perl6
my $out = $*IN.slurp(:close);
my @split = $out.split(/ ^^ 'Untracked files:' /);
if @split == 2 {
    my @split2 = @split[1].split(/ ^^ \s* $$ / );
    my $changes = 2 < @split2 ?? @split2.pop !! "";
    print "Untracked files:" ~ @split2.join ~ "\n" ~  @split[0].chomp ~ $changes;
    exit 0;
}
print @split.join;
exit 0;