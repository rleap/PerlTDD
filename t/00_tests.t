#!/usr/bin/perl

use strict;
use warnings;

use File::Basename qw(dirname);
use FindBin qw($Bin);
use lib dirname($Bin) . '/lib';

use Test::More;
use Perl::TDD::Fraction;

#AddFractionsTest
sub zeroPlusZero {

  my $fraction = Perl::TDD::Fraction->new();
  my $sum = $fraction;
  $sum->plus(0,0);
  is($sum->intValue(), 0, 'zero plus zero');

}

zeroPlusZero();

done_testing();
