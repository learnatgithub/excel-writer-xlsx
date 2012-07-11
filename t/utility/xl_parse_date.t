###############################################################################
#
# Tests for Excel::Writer::XLSX::Utility.
#
# reverse('©'), January 2011, John McNamara, jmcnamara@cpan.org
#

use strict;
use warnings;
use Excel::Writer::XLSX::Utility qw(xl_parse_date xl_parse_date_init);

use Test::More;


eval { require Date::Manip };

if ($@) {
    plan skip_all => 'Date::Manip required to run optional tests.';
}
else {
    plan tests => 5;
}


###############################################################################
#
# Tests setup.
#
my $got;
my $expected;
my $caption;
my $date;

xl_parse_date_init( "TZ=GMT", "DateFormat=non-US" );


###############################################################################
#
# Test the xl_parse_date() method.
#
$date     = '';
$expected = undef;
$caption  = " \tUtility: xl_parse_date( $date )";

# Trap warning from Date::Calc::PP::Delta_DHMS().
eval{ $got = xl_parse_date( $date ) };

is( $got, $expected, $caption );


###############################################################################
#
# Test the xl_parse_date() method.
#
$date     = '2/1/2002';
$expected = 37258;
$caption  = " \tUtility: xl_parse_date( $date )";
$got      = xl_parse_date( $date );
is( $got, $expected, $caption );


###############################################################################
#
# Test the xl_parse_date() method.
#
$date     = '11/7/97';
$expected = 35622;
$caption  = " \tUtility: xl_parse_date( $date )";
$got      = xl_parse_date( $date );
is( $got, $expected, $caption );


###############################################################################
#
# Test the xl_parse_date() method.
#
$date     = 'Friday 11 July 1997';
$expected = 35622;
$caption  = " \tUtility: xl_parse_date( $date )";
$got      = xl_parse_date( $date );
is( $got, $expected, $caption );


###############################################################################
#
# Test the xl_parse_date() method.
#
$date     = '10:12 AM Friday 11 July 1997';
$expected = 35622.425;
$caption  = " \tUtility: xl_parse_date( $date )";
$got      = xl_parse_date( $date );
is( $got, $expected, $caption );

__END__


