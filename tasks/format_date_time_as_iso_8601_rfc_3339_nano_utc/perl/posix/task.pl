#!/usr/bin/env perl
use warnings;
use POSIX;
my $f = "%Y-%m-%dT%H:%M:%S.000000000Z";
my $t = time();
my $s = strftime($f, gmtime($t));
print $s, "\n";
