#!/usr/bin/env perl
use strict;
use warnings;
use Test::More;
use JSON::XS;
use Test::Exception;
#use AnyEvent::Riak;
require "Riak.pm";

my ($host, $path) = ('http://127.0.0.1:8098', 'riak');
print "$host/$path\n";
#BEGIN {
#    my $riak_test = $ENV{RIAK_TEST_SERVER};
#    ( $host, $path ) = split ";", $riak_test if $riak_test;
#    plan skip_all =>
#        'set $ENV{RIAK_TEST_SERVER} like this http://127.0.0.1:8098;jiak if you want to run the tests'
#        unless ( $host && $path );
#}

my $jiak = AnyEvent::Riak->new( host => $host, path => $path );

ok my $buckets = $jiak->list_bucket('foo')->recv, "... fetch bucket list";
is scalar @{ $buckets->{keys} }, '0', '... no keys';

ok my $new_bucket = $jiak->set_bucket( 'foo', { allowed_fields => '*' } )->recv; #,
    #'... set a new bucket';

my $value = {
    bucket => 'foo',
    key    => 'bar',
    object => { foo => "bar", baz => 1 },
    links  => []
};

ok my $res = $jiak->store($value)->recv, '... set a new key';

ok $res = $jiak->fetch( 'foo', 'bar' )->recv, '... fetch our new key';
ok $res = $jiak->delete( 'foo', 'bar' )->recv, '... delete our key';

dies_ok { $jiak->fetch( 'foo', 'foo' )->recv } '... dies when error';
like $@, qr/404/, '... 404 response';

ok $res = $jiak->store($value)->recv, '... set a new key';
my $second_value = {
    
bucket => 'foo',
    key    => 'baz',
    object => { foo => "bar", baz => 2 },
    links  => [ [ 'foo', 'bar', 'tagged' ] ],
};
ok $res = $jiak->store($second_value)->recv, '... set another new key';

ok $res = $jiak->walk( 'foo', 'baz', [ { bucket => 'foo', } ] )->recv,
    '... walk';
is $res->{results}->[0]->[0]->{key}, "bar", "... walked to bar";

done_testing();
