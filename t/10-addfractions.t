use strict;
use warnings;

use File::Basename qw(dirname);
use FindBin qw($Bin);
use lib dirname($Bin) . '/lib';

use Data::Dumper qw(Dumper);
use Fennec;

BEGIN { use_ok 'Perl::TDD::Fraction', qw(fraction plus intValue) }

#AddFractionsTests
tests zeroPlusZero => sub {
    is( fraction(0)->plus( fraction(0) ), fraction(0),
        'zero plus zero' );
};

tests nonZeroPlusZero => sub {
    is( fraction(3)->plus( fraction(0) ),
        fraction(3), 'non zero plus zero' );
};

tests zeroPlusNonZero => sub {
    is( fraction(0)->plus( fraction(5) ),
        fraction(5), 'zero plus non zero' );
};

tests nonNegativeNonZeroOperands => sub {
    is( fraction(3)->plus( fraction(4) ),
        fraction(7), 'non negative non zero operands' );
};

tests negativeInputsAndNegativeOutputs => sub {
    is( fraction(-3)->plus( fraction(1) ),
        fraction(-2), 'negative inputs and negative outputs' );
};

tests nonTrivialButCommonDenominator => sub {
    is(
        fraction( 1, 5 )->plus( fraction( 2, 5 ) ),
        fraction( 3, 5 ),
        'non trivial but common denominator'
    );
};

tests differentDenominatorsWithoutReducing => sub {
    is(
        fraction( 1, 2 )->plus( fraction( 1, 3 ) ),
        fraction( 5, 6 ),
        'different denominators without reducing'
    );
};

tests reduceResultToWholeNumber => sub {
    is( fraction( 1, 3 )->plus( fraction( 2, 3 ) ),
        fraction(1), 'reduce result to whole number' );
};

tests oneDenominatorIsAMultipleOfTheOther => sub {
    is(
        fraction( 3,  4 )->plus( fraction( 5, 8 ) ),
        fraction( 11, 8 ),
        'one denominator is a multiple of the other'
    );
};

tests commonFactorInDenominators => sub {
    is(
        fraction( 1,  6 )->plus( fraction( 4, 9 ) ),
        fraction( 11, 18 ),
        'common factor in denominators'
    );
};

tests reduceResultsEvenWhenDenominatorsAreTheSame => sub {
    is(
        fraction( 3, 4 )->plus( fraction( 3, 4 ) ),
        fraction( 3, 2 ),
        'reduce results even when denominators are the same'
    );
};

tests negatvieFractionAndReducing => sub {
    is(
        fraction( -1, 4 )->plus( fraction( 3, 4 ) ),
        fraction( 1,  2 ),
        'negative fraction and reducing'
    );
    is(
        fraction( 3,  8 )->plus( fraction( -1, 2 ) ),
        fraction( -1, 8 ),
        'negative fraction and reducing'
    );
};

tests crazyNegativeSignsEverywhere => sub {
    is(
        fraction( 1, -4 )->plus( fraction( -3, -4 ) ),
        fraction( 1, 2 ),
        'crazy negative fraction and reducing'
    );
};

done_testing();
