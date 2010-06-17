#!/usr/bin/env perl
#http://wiki.kyberia.cz/doku.php?id=noda
use strict;
use warnings;
#use HTML::Template;
use JSON;
use Data::Dumper;

open FILE, "noda.json" or die "Couldn't open file: $!"; 
my $noda = join("", <FILE>); 
close FILE;

my $obj = decode_json($noda);

#print "owner: $obj->{'protected'}->{'owner'}\n";
print Dumper($obj);

