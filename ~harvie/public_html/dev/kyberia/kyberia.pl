#!/usr/bin/env perl
#http://wiki.kyberia.cz/doku.php?id=noda
use strict;
use warnings;
use CGI;
use HTML::Template; #we can use HTML::Template::Expr if we will need more complexity
use Data::Dumper;

require "lib/kyberia.pm";

require "storage_backends/".Kyberia::Config->get()->{'storage_backend'}->{'engine'};

#print Dumper(Kyberia::Config->get()); die;

# new cgi object
my $q = CGI->new;
# send the obligatory Content-Type
print $q->header('text/html');

#get node
my $id = $q->param('id');
if(!defined($id)) { $id = Kyberia::Config->get()->{'defaults'}->{'id'}; }
my $node_data_json = Kyberia::Storage->get_node($id);
my $node_data = Kyberia::Node->deserialize($node_data_json);
if(defined($node_data->{'error'})) { print $node_data->{'error'}."<br />\n"; 1; }

#get template
my $tpl = $q->param('tpl');
if(!defined($tpl)) { $tpl = $node_data->{'compulsory'}->{'template'}; }
if(!defined($tpl)) { $tpl = Kyberia::Config->get()->{'defaults'}->{'tpl'}; }
my $template_data_json = Kyberia::Storage->get_node($tpl);
my $template_data = Kyberia::Node->deserialize($template_data_json);
if(defined($template_data->{'error'})) { print $template_data->{'error'}."<br />\n"; 1; }

# open the html template
#my $template = HTML::Template->new(filename => 'JSONeditor.tmpl',die_on_bad_params => 0);
my $template = HTML::Template->new(scalarref => \$template_data->{'compulsory'}->{'text'}, die_on_bad_params => 0);

# fill in some parameters
$template->param(NODE_JSON => $node_data_json);

#print the template output
print $template->output;

