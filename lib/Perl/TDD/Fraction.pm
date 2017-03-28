package Perl::TDD::Fraction;

use strict;
use warnings;

use lib "/Users/rleap/Google/Projects/PerlTDD/lib";

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
    my $gcd = gcd($self->{numerator}, $self->{denominator});
    $self->{numerator} /= $gcd;
    $self->{denominator} /= $gcd;
    return $self;
}

sub plus {
    my $self = shift;
    my $that = shift;
    if ($self->{denominator} != $that->{denominator}) {
        return fraction($self->{numerator} * $that->{denominator} + $that->{numerator} * $self->{denominator},
            $self->{denominator} * $that->{denominator});
    } else {
        return fraction($self->{numerator} + $that->{numerator}, $self->{denominator});
    }
}

1;
