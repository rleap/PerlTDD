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
    is( fraction(0)->plus( fraction(0) )->intValue(), 0, 'zero plus zero');
};

tests nonZeroPlusZero => sub {
    is( fraction(3)->plus( fraction(0) )->intValue(), 3, 'non zero plus zero' );
};

tests zeroPlusNonZero => sub {
    is( fraction(0)->plus( fraction(5) )->intValue(), 5, 'zero plus non zero' );
};

tests nonNegativeNonZeroOperands => sub {
    is( fraction(3)->plus( fraction(4) )->intValue(), 7, 'non negative non zero operands' );
};

tests negativeInputsAndNegativeOutputs => sub {
    is( fraction(-3)->plus( fraction(1) )->intValue(), -2, 'negative inputs and negative outputs' );
};

tests nonTrivialButCommonDenominator => sub {
    my $sum = fraction(1,5)->plus( fraction(2,5) );
    is_deeply( fraction(3, 5), $sum);
};

done_testing();
