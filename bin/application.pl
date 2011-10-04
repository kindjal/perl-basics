#!/usr/bin/perl
#
# Perl applications live in files with the .pl extension and begin
# with the shebang line that identifies the perl interpreter to use.
#

# Always use strict and warnings.
use strict;
use warnings;

# This is our sample Application module, defined in ./lib
use Application;

# Print perl data structures, helpful for debugging
use Data::Dumper;

my $app = Application->new();
$app->run;

warn "This is app: " . Data::Dumper::Dumper $app;

