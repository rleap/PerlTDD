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
    is_deeply( fraction(0)->plus( fraction(0) ), fraction(0), 'zero plus zero');
};

tests nonZeroPlusZero => sub {
    is_deeply( fraction(3)->plus( fraction(0) ), fraction(3), 'non zero plus zero' );
};

tests zeroPlusNonZero => sub {
    is_deeply( fraction(0)->plus( fraction(5) ), fraction(5), 'zero plus non zero' );
};

tests nonNegativeNonZeroOperands => sub {
    is_deeply( fraction(3)->plus( fraction(4) ), fraction(7), 'non negative non zero operands' );
};

tests negativeInputsAndNegativeOutputs => sub {
    is_deeply( fraction(-3)->plus( fraction(1) ), fraction(-2), 'negative inputs and negative outputs' );
};

tests nonTrivialButCommonDenominator => sub {
    is_deeply( fraction(1,5)->plus( fraction(2,5) ), fraction(3, 5), 'non trivial but common denominator');
};

tests differentDenominatorsWithoutReducing => sub {
    is_deeply( fraction(1,2)->plus( fraction(1,3) ), fraction(5, 6), 'different denominators without reducing');
};

done_testing();
