
# Basic tests, see "man Test::More"
use Test::More;

# Tests for stdin,stdout,stderr, see "man Test::Output"
use Test::Output;

# Tests like lives_ok, etc, see "man Test::Exception"
use Test::Exception;

use_ok( 'Application', "module loads ok" );

my $app = Application->new();

ok( $app->{attr1} == 1, "app has attr1 = 1" );
ok( $app->{attr2} == 2, "app has attr2 = 2" );

lives_ok { $app->run(); } "app runs ok";
stdout_like { $app->run(); } qr/This method prints attr1/, "output looks ok";

done_testing();

