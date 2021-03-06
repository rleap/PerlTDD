package Perl::TDD::Fraction;

use strict;
use warnings;

#I don't like this, but FindBin was not working
use lib "/Users/rleap/Google/Projects/PerlTDD/lib";

use overload
  fallback => 1,
  '""' => 'equals';

use Exporter qw(import);
our @EXPORT_OK = qw(fraction plus intValue);

use Data::Dumper qw(Dumper);
use Perl::TDD::NumberTheory qw(gcd);

my $self;

sub fraction {
    my $class = __PACKAGE__;
    $self = bless {}, $class;
    $self->{numerator} = shift;
    $self->{denominator} = shift || 1;
    my $signOfDenominator = $self->{denominator} < 0 ? -1 : 1;

    #CONTRACT: gcd() never returns 0
    my $gcd =
      gcd( $self->{numerator}, $self->{denominator} ) * $signOfDenominator;
    $self->{numerator}   /= $gcd;
    $self->{denominator} /= $gcd;
    return $self;
}

sub plus {
    my $self = shift;
    my $that = shift;
    return fraction(
        $self->{numerator} * $that->{denominator} +
          $that->{numerator} * $self->{denominator},
        $self->{denominator} * $that->{denominator}
    );
}

sub equals {
  my $self = shift;
  if (ref $self eq 'Fraction') {
    my $that = $self;
    return $self->{numerator} == $that->{numerator}
      && $self->{denominator} == $that->{denominator};
  }
  return 0;
}

1;
