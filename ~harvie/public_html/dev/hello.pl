#!/usr/bin/env perl
use strict;
use CGI;

my $now = localtime;

my $cgi = new CGI;
print $cgi->header(-type => "text/html", -charset=>"utf-8");
print $cgi->start_html("Hello World");
print $cgi->h2("Hello World");
print $now;
print $cgi->end_html;
