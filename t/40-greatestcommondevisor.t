use strict;
use warnings;

use File::Basename qw(dirname);
use FindBin qw($Bin);
use lib dirname($Bin) . '/lib';

use Data::Dumper qw(Dumper);
use Fennec;

BEGIN { use_ok 'Perl::TDD::NumberTheory', qw(gcd) }

#GreatestCommonDevisorTests
tests reflexive => sub {
    is( gcd(1, 1), 1, 'gcd one and one');
    is( gcd(2, 2), 2, 'gcd two and two');
    is( gcd(-1, -1), 1, 'gcd negative one and one');
};

tests relativelyPrime => sub {
    is( gcd(2, 3), 1, 'gcd two and three');
    is( gcd(4, 7), 1, 'gcd four and seven');
    is( gcd(-2, -3), 1, 'gcd negative two and three');
};

tests oneIsMultipleOfTheOther => sub {
    is( gcd(3, 9), 3, 'gcd three and nine');
    is( gcd(5, 30), 5, 'gcd five and thirty');
};

tests commonFactor => sub {
    is( gcd(6, 8), 2, 'gcd six and eight');
    is( gcd(49, 315), 7, 'gcd fortynine and threehundredfifteen');
    is( gcd(-24, -28), 4, 'gcd negative twentyfour and twentyeight');
};

tests negatives => sub {
    is( gcd(-24, 28), 4, 'gcd negative twentyfour and positive twentyeight');
    is( gcd(24, -28), 4, 'gcd positive twentyfour and negative twentyeight');
};

done_testing();
