use strict;
use warnings;

use File::Basename qw(dirname);
use FindBin qw($Bin);
use lib dirname($Bin) . '/lib';

use Data::Dumper qw(Dumper);
use Fennec;

BEGIN { use_ok 'Perl::TDD::Fraction', qw(fraction plus intValue) }

#GreatestCommonDevisorTests
tests oneAndOne => sub {
    is( gcd(1, 1), 1, 'gcd one and one');
};

sub gcd {
    my ($a, $b) = @_;
    while ($b != 0) {
        my $t = $b;
        $b = $a % $t;
        $a = $t;
    }
    return $a;
}

done_testing();
