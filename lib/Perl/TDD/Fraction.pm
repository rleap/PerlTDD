package Perl::TDD::Fraction;

use strict;
use warnings;

use Exporter qw(import);
our @EXPORT_OK = qw(fraction plus intValue);

use Data::Dumper qw(Dumper);

my $self;
$self->{denominator} = 1;

sub fraction {
    my $class = __PACKAGE__;
    $self = bless {}, $class;
    $self->{numerator} = shift;
    $self->{denominator} = shift;
    $self->{integerValue} = $self->{numerator};
    return $self;
}

sub plus {
    my $self = shift;
    my $that = shift;
    return fraction($that->{integerValue} + $self->{integerValue}, $self->{denominator});
}

sub intValue {
    my $self = shift;
    return $self->{integerValue};
}

sub getNumerator{
    return 3;
}

sub getDenominator{
    my $self = shift;
    return $self->{denominator};
}

1;
