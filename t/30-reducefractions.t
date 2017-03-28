use strict;
use warnings;

use File::Basename qw(dirname);
use FindBin qw($Bin);
use lib dirname($Bin) . '/lib';

use Data::Dumper qw(Dumper);
use Fennec;

BEGIN { use_ok 'Perl::TDD::Fraction', qw(fraction plus intValue) }

#ReduceFractionsTests
tests alreadyInLowestTerms => sub {
    is_deeply( fraction(3, 4), fraction(3, 4), 'already in lowest terms');
};

tests reduceToNotWholeNumber => sub {
    is_deeply( fraction(3, 4), fraction(6, 8), 'reduce to not whole number');
};

done_testing();
