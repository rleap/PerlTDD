package Perl::TDD::Fraction;

use strict;
use warnings;

use Exporter qw(import);
our @EXPORT_OK = qw(fraction plus inValue);

sub fraction {
  my $class = __PACKAGE__;
  my $self = bless {}, $class;
  $self->{integerValue} = shift;
  return $self;
}

sub plus {
  my $self = shift;
  return $self;
}

sub intValue {
  my $self = shift;
  return $self->{integerValue};
}

1;
