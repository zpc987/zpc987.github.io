#!/usr/local/bin/perl
use v5.22;
use utf8;
open HD,"<:encoding(UTF-8)",$ARGV[0] or die $!; 

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

my ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime();
$year = $year + 1900;
my $title = "title: \"$year-$months[$mon]-$mday-$hour:$min:$sec\"\n";

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
my $date  = "date: $year-$months[$mon]-$mday $hour:$min:$sec\n";
open my $diary,">:encoding(UTF-8)","$year-$months[$mon]-$mday-$hour-$min-$sec.md";


print $diary "---\n";
print $diary "layout: post\n";
print $diary $title;
print $diary $date;
print $diary "tags: 心情日记\n";
print $diary "description: $week{$days[$wday]}\n"; 
print $diary "---\n";
