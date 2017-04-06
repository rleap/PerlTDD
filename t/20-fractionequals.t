use strict;
use warnings;

use File::Basename qw(dirname);
use FindBin qw($Bin);
use lib dirname($Bin) . '/lib';

use Data::Dumper qw(Dumper);
use Fennec;

BEGIN { use_ok 'Perl::TDD::Fraction', qw(fraction plus intValue) }

#FractionEqualsTests
tests sameNumeratorAndDenominator => sub {
    is( fraction( 3, 5 ), fraction( 3, 5 ),
        'adding same two fractions' );
};

tests differentNumerators => sub {
    is( fraction( 1, 5 ), fraction( 2, 5 ), 'different numerators' );
};

tests differentDenominators => sub {
    is( fraction( 3, 4 ), fraction( 3, 7 ),
        'different denominators' );
};

tests wholeNumberEqualsSameFraction => sub {
    is( fraction( 5, 1 ),
        fraction(5), 'whole number equals same fraction' );
};

tests wholeNumberNotEqualToDifferentWholeNumber => sub {
    is( fraction(6), fraction(5),
        'whole number not equal to different whole number' );
};

tests negativeDenominator => sub {
    is( fraction( 1,  2 ), fraction( -1, -2 ), 'negative denominator' );
    is( fraction( -1, 2 ), fraction( -1, 2 ),  'negative denominator' );
};

done_testing();
