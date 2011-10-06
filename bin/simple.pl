#!/usr/bin/perl
#
# This script defines two classes and a "main".
# Here we see object oriented style within a
# single file script.
#

use strict;
use warnings;

package Someclass;

sub new {
    my $class = shift;
    my $self = {
        something => 'foo',
    };
    bless $self,$class;
    return $self;
}

package Application;

# Standard perl option parsing module
use Getopt::Std;

sub new {
    my $class = shift;
    my $self = {
        attr1 => 1,
        attr2 => 2,
    };
    bless $self,$class;
    return $self;
}

sub method {
    my $self = shift;
    print "This method prints attr1: " . $self->{attr1} . "\n";
}

sub usage {
    my $self = shift;
    print <<EOF;
Usage: $0 [-h] [-x number]
     -h            This helpful message
     -x [number]   Some option with an argument
EOF
}

sub run {
    my $self = shift;

    # Read command line options into the %opts hash
    my %opts;
    getopts("hx:",\%opts) or usage;

    # Do stuff with the options
    usage if ($opts{h});
    my $value = delete $opts{x};

    # Call a method
    $self->method;

    my $something = Someclass->new();
    warn "someclass: " . Data::Dumper::Dumper $something;
}

package main;
# "main" is a reserved clas that lets us define separate
# classes as packages above.  This is the part that runs
# when you run this script.

# Print perl data structures, helpful for debugging
use Data::Dumper;

my $app = Application->new();
$app->run;

warn "This is app: " . Data::Dumper::Dumper $app;

