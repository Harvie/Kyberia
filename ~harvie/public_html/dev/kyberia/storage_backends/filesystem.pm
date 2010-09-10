#!/usr/bin/env perl
use strict;
use warnings;

package Kyberia::Storage;
	use URI::Escape;
	require "lib/kyberia.pm";

	#Kyberia::Config->get()->{'storage_backend'}->{'options'}->{'directory'};
	#our $config;

	#our	$config = Kyberia::Config->get()->{'options'};

	sub new { #constructor
		my ($self) = @_;
		#$config = Kyberia::Config->get()->{'options'};
		return $self;
	}

	sub get_node_filename {
		my ($self, $id) = @_;
		#new($self);
		return(Kyberia::Config->get()->{'storage_backend'}->{'options'}->{'directory'}.uri_escape($id)); #URI Escape handles directory traversal quite well
		#return($config->{'directory'}."$id");
	}

	sub get_node {
		my ($self, $id) = @_;
		my $file = get_node_filename($self, $id);
		open FILE, $file or return("{\"error\":\"Couldn't open file: $!: $file\"}");
		my $noda = join("", <FILE>);
		close FILE;
		return($noda);
	}

	sub put_node {
	}


1;
