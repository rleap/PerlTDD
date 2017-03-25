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
    $self->{integerValue} = shift;
    return $self;
}

sub plus {
    my $self = shift;
    my $that = shift;
    if ( $that->{integerValue} != 0 ) {
        return $that;
    }
    else {
        return $self;
    }
}

sub intValue {
    my $self = shift;
    return $self->{integerValue};
}

1;
