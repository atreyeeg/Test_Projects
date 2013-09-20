#This is a program that will check if a word is palindrome or not.
#Like if we reverse a word and that remain the same then we call it as a Palindrome word.
#Example : taat , tat,ata those are palindrome word
#Author: Atreyee Gupta

print "Enter a word: \n";

my $input=<STDIN>;
print "\n \n";
chomp($input);
my @word = split //, $input;
#print "the word is ", @word ,"\n";
my $flag=0;
my $word_status=check_palindrome(@word,$flag);
if ($word_status) {
	print " this is a palindrome word \n";	
}

sub check_palindrome
{
my $len=$#word;
#print " the word len:" ,$len,"\n"; 
my $j=0;
my $flag=0;
for( my $i=0;$i<=$len;$i++ ){
	
	
	if($word[$i] eq $word[$len-$j]){
	}else{
		print " this is not a palindrome word \n";
		exit;
	}
	$j++;
	$flag=1;
}
return $flag;
}
