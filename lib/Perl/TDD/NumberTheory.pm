package Perl::TDD::NumberTheory;

use strict;
use warnings;

use Exporter qw(import);
our @EXPORT_OK = qw(gcd);

use Data::Dumper qw(Dumper);

sub gcd {
    my ( $a, $b ) = @_;
    while ( $b != 0 ) {
        my $t = $b;
        $b = $a % $t;
        $a = $t;
    }
    return abs($a);
}

1;
