#!/usr/bin/perl
use strict;
use warnings;
 
my $file = "apache_access.log";

open my $fh, '<', $file or die "Could not open '$file': $!";
 
 
my $home  = 0;
my $remote = 0;

while (my $line = <$fh>) {
    my $length = index ($line, " ");
    my $ip = substr($line, 0, $length);
    if ($ip eq "127.0.0.1") {
        $home++;
    } 
    else {
        $remote++;
    }
}
 
print "Home: $home Remote: $remote\n";