#!/usr/bin/env perl6
my Str:D $out = $*IN.slurp(:close);
my Str:D @split = $out.split(/ ^^ 'Untracked files:' /);
note "#### Something went wrong with @*ARGS[0] falling back to original git output.";

if @split == 2 {
    my @split2 = @split[1].split(/ ^^ \s* $$ / );
    my $changes = 2 < @split2 ?? @split2.pop !! "";
    print "Untracked files:" ~ @split2.join ~ "\n" ~  @split[0].chomp ~ $changes;
    exit 0;
}
my Str:D $output = @split.join;
if !$output {
    $out.print;
    note "#### Something went wrong with @*ARGS[0] falling back to original git output.";
    exit 1;
}
$output.print;
exit 0;