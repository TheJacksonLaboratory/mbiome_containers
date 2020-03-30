#!/usr/bin/perl
use Getopt::Long;
use strict;
use vars qw/$opt_reverse $opt_help/;

GetOptions("help|h","reverse|v");


if ($opt_help) {
    print "Usage: cat input.fq | perl -.pl [-v] list  \n\n";
    print "-v\tReverse, filter out those in list\n";
    exit;
 
}

open RD, $ARGV[0];
my %h;
while(<RD>){
    chomp;
#    $h{$_}=1;   #match whole line, default is to match /^(\S+)/, better fit for the pattern grep in read processing
    if(/^(\S+)/){
	$h{$1}=1;
    }
}
close(RD);
my $one=1;
my $zero=0;
if($opt_reverse){
    $one=0;
    $zero=1;
}

my $tag=$zero;
my $n=0;
while(<STDIN>){
    chomp;
    $n+=1;
    if($n % 4==1){
	if($_=~/^@(\S+)/){
	    if($h{$1}){
		$tag=$one;
	    }else{
		$tag=$zero;
	    }
	}
    }
    if($tag==1){
	print "$_\n";
	}
}
