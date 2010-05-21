#!/usr/bin/env perl
use strict;
use warnings;
use JSON::XS;
use Data::Dumper;
require "Riak.pm";

my ($host, $path, $bucket) = ('http://127.0.0.1:8098', 'riak', 'harvie');

#connect
my $jiak = AnyEvent::Riak->new( host => $host, path => $path );

my $res;

#$res = $jiak->walk( $bucket, 'foo2', [ { bucket => $bucket, key => '_' } ] )->recv;
#$res->{results}->[0]->[0]->{key}; # "bar", "... walked to bar";

ok $res = $jiak->walk( 
        'harvie', 
        'foo', 
        [ { bucket => 'harvie', key => '_' } ] 
    )->recv;

print Dumper("walk results:\n".$res."\n");


