#!/usr/bin/env perl
use strict;
use warnings;
#use Test::More;
use JSON::XS;
#use Test::Exception;
#use AnyEvent::Riak;
use Data::Dumper;
require "Riak.pm";

my ($host, $path, $bucket) = ('http://127.0.0.1:8098', 'riak', 'harvie');

#connect
my $jiak = AnyEvent::Riak->new( host => $host, path => $path );

#list keys (sloooooow)
	#my $keys = $jiak->list_bucket($bucket)->recv;
	#print "Keys in $bucket:\n".Dumper($keys->{keys});

#my $bck = $jiak->set_bucket($bucket, { allowed_fields => '*' } )->recv;

my $value = {
    bucket => $bucket,
    key    => 'bar',
    object => { foo => "bar", baz => 1 },
    links  => []
};

#my $res = $jiak->store($value)->recv;
my $res = $jiak->store({
    bucket => $bucket,
    key    => 'bar',
    object => { foo => "bar", baz => 1 },
    links  => []
})->recv;



print "Stored in $bucket:\n".Dumper($res);
die;


#fetch key
$res = $jiak->fetch($bucket, 'bar' )->recv;
#delete key
$res = $jiak->delete($bucket, 'bar' )->recv;


$res = $jiak->walk( 'foo', 'baz', [ { bucket => 'foo', } ] )->recv
#$res->{results}->[0]->[0]->{key}; # "bar", "... walked to bar";

