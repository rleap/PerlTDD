package Perl::TDD::Fraction;

use strict;
use warnings;

use Exporter qw(import);
our @EXPORT_OK = qw(fraction plus intValue);

use Data::Dumper qw(Dumper);

my $self;

sub fraction {
    my $class = __PACKAGE__;
    $self = bless {}, $class;
    $self->{numerator} = shift;
    $self->{denominator} = shift || 1;
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
