
package Application;

use strict;
use warnings;

# Standard perl option parsing module
use Getopt::Std;

sub new {
    my $class = shift;
    my $self = {
        attr1 => 1,
        attr2 => 2,
    };
    bless $self, $class;
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
}

1;
