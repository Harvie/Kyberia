#Kyberia.CZ
Decentralized neuro-social network for sharing love and informations while still being secure and private (unlike Faceb**k) designed to create internet superconsciousness. This is an official repository of Kyberia.CZ project. (We are not diaspora - really!)

  * http://wiki.kyberia.cz/

##Installation
  * Install PERL (+modules) and configure webserver to handle .pl files
  * Copy to your webserver's path
  * Edit files in ./config/ properly
  * Set permissions proberly (will add makefile later)

###PERL Modules that you may need
  * CGI
  * JSON
  * HTML::Template
  * Data::Dumper
  * URI::Escape

###lighttpd.conf:
(it's actually suboptimal, since it does not use fast-cgi, i'll fix it later)
<pre><code>
...
server.modules = (
  "mod_cgi"
  ...
)
...
static-file.exclude-extensions = ( ".php", ".pl", ".cgi", ".fcgi" )
...
cgi.assign = (
  ".pl"  => "/usr/bin/perl",
  ...
)
...
</code></pre>
