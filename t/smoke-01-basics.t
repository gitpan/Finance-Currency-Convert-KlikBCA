#!perl

BEGIN {
  unless ($ENV{AUTOMATED_TESTING}) {
    require Test::More;
    Test::More::plan(skip_all => 'these tests are for "smoke bot" testing');
  }
}


use 5.010;
use strict;
use warnings;

use Perinci::Import 'Finance::Currency::Convert::KlikBCA',
    get_currencies => {exit_on_error=>1};
use Test::More 0.98;

my $res = get_currencies();
is($res->[0], 200, "get_currencies() succeeds")
    or diag explain $res;

done_testing;
