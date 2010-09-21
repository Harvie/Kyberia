#!/usr/bin/env perl
use strict;
use warnings;

package Kyberia::Config;
	use JSON;

	our $data; #we'll cache the config data to this variable
	sub get {
		my $self = shift;
		if(!defined($data)) {
			open FILE, "config/kyberia.json" or die "Couldn't open file: $!";
			my $noda = join("", <FILE>);
			close FILE;
			$data = decode_json($noda);
		}
		return($data);
	}


package Kyberia::Node;
	use JSON;

	our ($sr, $su, $ss) = (0,0,0); #calibrators

	sub new { #constructor
  	my ($self, $ncalib) = @_;
  	return $self;
  }

	sub deserialize {
		my ($self, $data) = @_;
		my $json = JSON->new->relaxed;
		$data = $json->decode($data);
		return($data);
	}


1;
