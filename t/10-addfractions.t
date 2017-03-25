use strict;
use warnings;

use File::Basename qw(dirname);
use FindBin qw($Bin);
use lib dirname($Bin) . '/lib';

use Data::Dumper qw(Dumper);
use Fennec;

BEGIN { use_ok 'Perl::TDD::Fraction', qw(fraction plus intValue) }

#AddFractionsTest
tests zeroPlusZero => sub {
    my $sum = fraction(0)->plus( fraction(0) );
    is( $sum->intValue(), 0, 'zero plus zero');
};

tests nonZeroPlusZero => sub {
    my $sum = fraction(3)->plus( fraction(0) );
    is( $sum->intValue(), 3, 'non zero plus zero' );
};

tests zeroPlusNonZero => sub {
    my $sum = fraction(0)->plus( fraction(5) );
    is( $sum->intValue(), 5, 'zero plus non zero' );
};

tests nonNegativeNonZeroOperands => sub {
    my $sum = fraction(3)->plus( fraction(4) );
    is( $sum->intValue(), 7, 'non negative non zero operands' );
};

tests negativeInputsAndNegativeOutputs => sub {
    my $sum = fraction(-3)->plus( fraction(1) );
    is( $sum->intValue(), -2, 'negative inputs and negative outputs' );
};

done_testing();
