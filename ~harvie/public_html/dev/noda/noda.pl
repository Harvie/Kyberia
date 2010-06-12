#!/usr/bin/env perl
#http://wiki.kyberia.cz/doku.php?id=noda
use strict;
use warnings;
use HTML::Template;

# open the html template
my $template = HTML::Template->new(filename => 'JSONeditor.tmpl',die_on_bad_params => 0);

open FILE, "noda.json" or die "Couldn't open file: $!"; 
my $noda = join("", <FILE>); 
close FILE;

# fill in some parameters
$template->param(NODE => $noda);

# send the obligatory Content-Type and print the template output
print "Content-Type: text/html\n\n", $template->output;

