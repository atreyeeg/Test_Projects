#Given an arbitrary text document written in English, write a program that will generate a
#concordance, i.e. an alphabetical list of all word occurrences, labeled with word frequencies.
=head
Sample input:
#===============
#I stay in Pune. That is a city from Maharashtra, India.
#I like that place as that is having a very nice weather
#and with nice people around. Maharashtra is one of the very
#big state in India.
#===============
#Sample output
#===============
F:\Atreyee\perl>perl Concordance.pl test_concor.txt
test_concor.txt is provided from the cmd line
**********


THE OUTPUT IS
**********
         WORD    FREQUENCY
        a       2
        and     1
        around  1
        as      1
        big     1
        city    1
        from    1
        having  1
        i       2
        in      2
        india   2
        is      3
        like    1
        maharashtra     2
        nice    2
        of      1
        one     1
        people  1
        place   1
        pune    1
        state   1
        stay    1
        that    3
        the     1
        very    2
        weather 1
        with    1
**********



F:\Atreyee\perl>
=cut
use strict;
use warnings;

use IO::File;
use List::Util;

#Declation of variables
my $i=0;my $j=0;my $itr=0;
my (@array_of_words,@tmp,@sorted_word,@line_num);
my %counts;
my $filename=shift @ARGV;

#File handling
open FH, $filename or die "Could not open $filename";
print "$filename is provided from the cmd line \n";
print "********** \n";
print "\n\n";
while (<FH>) {
	 @tmp = split ;
	 push @array_of_words, [ @tmp ];
}
my $num_of_lines=$#array_of_words;
#print "number of lines",$num_of_lines , "\n";

for $i ( 0 .. $#array_of_words ) {
        my $aref = $array_of_words[$i];
		my $word_freq=0;
		my @line_num=$i;
		
        for $j ( 0 .. $#{$aref} ) {
			#Remove any punctuation from the word
			$array_of_words[$i][$j] =~ s/[[:punct:]]//g;
			#Convert the word into lower case
			$array_of_words[$i][$j]=lc($array_of_words[$i][$j]);
			#Insert the unique word in the hash
			$counts{$_}++ for $array_of_words[$i][$j]
				
		}
}

print "THE OUTPUT IS \n";
print "********** \n";
print " \t WORD \t FREQUENCY \n";
for $i (sort keys %counts){
		print "\t",$i,"\t",$counts{$i},"\n";
	
}
print "********** \n";
print "\n\n";
close FH;
