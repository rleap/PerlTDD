#!/usr/bin/perl

use strict;
use warnings;
use Data::Dumper qw(Dumper);
use File::Basename qw(dirname);
use FindBin qw($Bin);
use lib dirname($Bin) . '/lib';
use Test::More;
use Perl::TDD::Fraction qw(fraction plus inValue);

#AddFractionsTest
sub zeroPlusZero {

  my $sum = fraction(0)->plus(fraction(0));
  is($sum->intValue(), 0, 'zero plus zero');

}

sub nonZeroPlusZero{

  my $sum = fraction(3)->plus(fraction(0));
  is($sum->intValue(), 3, 'non zero plus zero');

}

zeroPlusZero();
nonZeroPlusZero();

done_testing();
