use strict;
use warnings;

use File::Basename qw(dirname);
use FindBin qw($Bin);
use lib dirname($Bin) . '/lib';

use Test::More;

BEGIN { use_ok( 'Perl::TDD::Fraction', qw(fraction plus intValue) ) }

require_ok('Perl::TDD::Fraction');

done_testing();
