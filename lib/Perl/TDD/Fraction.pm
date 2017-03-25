package Perl::TDD::Fraction;

use strict;
use warnings;

sub new {
  return bless {}, __PACKAGE__;
}

sub plus {
  my $v = shift;
  return $v;
}

sub intValue {
  return 0;
}

1;
