# Here we write unit tests for a self-contained
# perl script, not a perl module.

# $top is the top level directory of this project.
# We need this to find $top/bin/simple.pl.
use File::Basename qw/dirname/;
use FindBin;
my $top = dirname $FindBin::Bin;

# Load the script we're going to be testing.
# We do this because it's not a "module" or .pm file.
require "$top/bin/simple.pl";

# Basic tests, see "man Test::More"
use Test::More;

# Tests for stdin,stdout,stderr, see "man Test::Output"
use Test::Output;

# Tests like lives_ok, etc, see "man Test::Exception"
use Test::Exception;

use Application;

my $app = Application->new();

# check the value of attr1 using the accessor
ok( $app->attr1() == 1, "app has attr1 = 1" );

# check the value of attr2 by accessing the object hash directly
# (usually considered bad practice) since all hash properties lack immutability)
ok( $app->{attr2} == 2, "app has attr2 = 2" );

lives_ok { $app->run(); } "app runs ok";
stdout_like { $app->run(); } qr/This method prints attr1/, "output looks ok";

done_testing();

