#!/usr/bin/perl

use strict;
use warnings;

use Test::More;

use File::Basename qw(dirname);
use FindBin qw($Bin);
use lib dirname($Bin) . '/lib';

use Perl::TDD qw(add);


done_testing();
