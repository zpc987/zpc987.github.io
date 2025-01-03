#!/usr/local/bin/perl
#
#日记生成模板
#
#
use v5.22;
use utf8;
binmode(STDOUT, ':encoding(utf8)');
#open HD,"<:encoding(UTF-8)",$ARGV[0] or die $!; 

my $weather;

print "Please input the weather\n";
print "1: 晴\n";
print "2：阴\n";
print "3：雨\n";
print "4：雪\n";
chomp( $weather = <STDIN> );

while($weather != 1 
        and $weather != 2 
        and $weather != 3 
        and $weather != 4 )
{
print "weather must be 1-4,input again\n";
chomp( $weather = <STDIN> );
}

#my @months = qw( Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec );
my @months = qw( 01 02 03 04 05 06 07 08 09 10 11 12 );
my @days = qw(Sun Mon Tue Wed Thu Fri Sat Sun);

my %week = (
    Sun => "星期日",
    Thu => "星期四",
    Wed => "星期三",
    Mon => "星期一",
    Tue => "星期二",
    Fri => "星期五",
    Sat => "星期六",
);

my %hweather = (
    1 => "晴",
    2 => "阴",
    3 => "雨",
    4 => "雪",
);


my ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime();
$year = $year + 1900;

sub add_zero {
    $_ = shift;
    if ($_ < 10) {
        $_ = "0".$_;
    }
    return $_;
}


$mday = &add_zero($mday);
$hour = &add_zero($hour);
$min  = &add_zero($min );
$sec  = &add_zero($sec );
print "$mday $months[$mon] $days[$wday]\n";
my $title = "title: \"$year-$months[$mon]-$mday-$hour:$min:$sec\"\n";
my $date  = "date: $year-$months[$mon]-$mday $hour:$min:$sec\n";

=pod
print  "---\n";
print  "layout: post\n";
print  $title;
print  $date;
print  "tags: 心情日记\n";
print  "description: $week{$days[$wday]}  $hweather{$weather}\n"; 
print  "---\n";

=cut

open my $diary,">:encoding(UTF-8)","$year-$months[$mon]-$mday-$hour-$min-$sec.md";


print $diary "---\n";
print $diary "layout: post\n";
print $diary $title;
print $diary $date;
print $diary "tags: 心情日记\n";
print $diary "description: $week{$days[$wday]}  $hweather{$weather}\n"; 
print $diary "---\n";
