#!/usr/bin/perl

# Project : TryPerl
# Author : Thibault Duponchelle
# executor.cgi is a kind of safe online REPL
# subs init/success and param lesson are used for TryPerl only 

use strict; # Not heavily tested with this
use warnings; 
use CGI;
use Safe;

print "Content-Type: text/plain\n\r\n\r";
my $query = CGI->new;
my %params = $query->Vars;

my $cmd = $params{'cmd'};
my $lesson = $params{'lesson'};
my $verbose = $params{'verbose'};

$verbose and 
print "[$cmd]\n\r";

(!$cmd) and print "Nothing to execute\n";

# Our CGI/Perl interpreter does not keep context between calls
# Something I learnt from demos and assembly coding is that 
# We could lie to our user, and make him believe wrong statements
# When we can't we could simulate :)
# E.G. I ask to do a $var = "onion" in lessonN and use $var in lessonN+1
sub init($) {
	my $l = shift;
	#print "lesson : $lesson";
	if($l == 1) {
		# Nothing to init
	} elsif($l == 7) {
		$Jail::u = undef; # First declaration
	} elsif($l == 8) {
		$Jail::i = 42;    # First declaration of a number
	} elsif($l == 10) {
		$Jail::str = " 13 "; # String easy to convert to number 
	} elsif($l == 12) {
		$Jail::tor = "onion "; # With a trailing space
	} elsif($l == 13) {
		$Jail::tor = "onion"; # Space chomped
	} elsif($l == 15) {
		@Jail::arr = ("onion", "c", "b", "a"); # Count array items
	} elsif($l == 16) { 
		@Jail::arr = ("onion", "c", "b", "a"); # Shift 
	} elsif($l == 17) {
		@Jail::arr = ("c", "b", "a"); # Shifted, pop "a"
	} elsif($l == 18) {
		@Jail::arr = ("c", "b"); # Popped, will push "a" 
	} elsif($l == 19) {
		@Jail::arr = ("c", "b", "a"); # Push an array into the array
	} elsif($l == 20) {
		@Jail::arr = ("c", "b", "a", "x", "y", "z"); # Extended, play with foreach/reverse/sort
	} elsif($l == 21) {
		@Jail::arr = ("c", "b", "a", "x", "y", "z"); # Range then splice
	} elsif($l == 22) {
		@Jail::arr = ("c", "b", "a"); # Get item, multiple get
	} elsif($l == 23) {
		$Jail::a = "c"; # We play with individuals now
		$Jail::b = "b"; # Exchange values actually
		$Jail::c = "a"; #
	} elsif($l == 24) {
		$Jail::a = "a"; # Print our values
		$Jail::b = "b"; #
		$Jail::c = "c"; #
	} elsif($l == 25) {
		@Jail::arr = ("c", "b", "a"); # Back to our dirty array, print sort
	} elsif($l == 26) {
		@Jail::arr = ("c", "b", "a"); # Get last item
	} elsif($l == 27) {
		@Jail::arr = ("c", "b", "a"); # Join
	} elsif($l == 28) {
		@Jail::arr = ("c", "b", "a"); # Split
	} elsif($l == 29) {
		$Jail::f = "john"; # Print split result
		$Jail::l = "doe";  #
		$Jail::a = "30";   #
	# Constructions if,unless,logic,etc...
	} elsif($l == 36) {
		$Jail::h{'key1'} = "val1"; # Print values
		$Jail::h{'key2'} = "val2"; # Using keys
	} elsif($l == 37) {
		$Jail::h{'key1'} = "val1"; # Print values 
		$Jail::h{'key2'} = "val2"; # Unsing values and join
	} elsif($l == 40) {
		@Jail::arr = ("c", "b", "a"); # Deref an array
		$Jail::h{'key1'} = "val1";    # Deref an hash
		$Jail::h{'key2'} = "val2";    # 
	}
}

# This function is used to detect when we need to go to next lesson
# The decision is based lesson number and command
sub success($$) {
	my $l = shift;
	my $c = shift;
	
	if($l == 0) {
		if($c =~ m/^\s*\d+\s*\+\s*\d+\s*$/) { # 3 + 6
			print "Well done !\n\r\n\r";
		} elsif($c =~ m/^\s*"code tag"\s*$/) { # "code tag 
			print "LAZY ! LAZY ! LAZY ! xD\n\r\n\r";
		} else {
			print "Try again...\n\r\n\r";
		}
	} elsif($l == 1) {
		if($c =~ m/^\s*reverse\s+"\w+"\s*$/) { # reverse "onion"
			print "SUCCESS !\n\r\n\r";
		} else {
			print "Try again...\n\r\n\r";
		}
	} elsif($l == 2) { 
		if($c =~ m/^\s*lc\s+"\w+"\s*$/) { # lc "onion"
			print "SUCCESS !\n\r\n\r";
		}
		if($c =~ m/^\s*uc\s+"\w+"\s*$/) { # uc "onion"
			print "SUCCESS !\n\r\n\r";
		} else {
			print "Try again...\n\r\n\r";
		}
	} elsif($l == 3) {
		if($c =~ m/^\s*length\s+"\s*\w+\s*"\s*$/) { # length "banana"
			print "Nice job ! I know that you like bananas !\n\r\n\r";
		} elsif($c =~ m/^\s*length\s+\d+\s*$/) { # length 123
			print "Yeah ! It works even with numbers !\n\r\n\r";
		} elsif($c =~ m/^\s*length\s+\d+\.0+\s*$/) { # length 123.00
			print "SUCCESS !\n\r\n\r";
		} else {
			print "Try again...\n\r\n\r";
		}
	} elsif($l == 4) {
		if($c =~ m/^\s*cwsinabs\s+\-\d+\s*$/) { # sin 2
			print "SUCCESS !\n\r\n\r";
		} elsif($c =~ m/^\s*sin\s+\d+.\d+\s*$/) { # sin 2.2
			print "SUCCESS !\n\r\n\r";
		} elsif($c =~ m/^\s*cos\s+\d+\s*$/) { # cos 2
			print "SUCCESS !\n\r\n\r";
		} elsif($c =~ m/^\s*cos\s+\d+\.\d+\s*$/) { # cos 2.2
			print "SUCCESS !\n\r\n\r";
		} else {
			print "Try again...\n\r\n\r";
		}
	} elsif($l == 5) {
		if($c =~ m/^\s*"-"\s*x\s*\d+\s*$/) { # "-" x 10
			print "Good ! It's sooo cooool right ?!\n\r\n\r";
		}elsif($c =~ m/^\s*\d+\s*x\s*\d+\s*$/) { # 42 x 10
			print "Converted to string then concatenated !\n\r\n\r";
		}elsif($c =~ m/^\s*\d+\s*\*\s*\d+\s*$/) { # 42 * 10
			print "Multiplication !\n\r\n\r";
		}elsif($c =~ m/^\s*"\/\\\\_"\s*x\s*\d+\s*$/) { # "/\_" x 10
			print "SUCCESS !\n\r\n\r";
		} else {
			print "Try again...\n\r\n\r";
		}
	} elsif($l == 6) {
		if($c =~ m/^\s*\$u\s*=\s*undef\s*$/) { # $u = undef
			print "SUCCESS !\n\r\n\r";
		} else {
			print "Try again...\n\r\n\r"; 
		}
	} elsif($l == 7) {
		if($c =~ m/^\s*\$\w+\s*=\s*\d+\s*$/) { # $i = 42
			print "SUCCESS !\n\r\n\r";
		} else {
			print "Try again...\n\r\n\r";
		}
	} elsif($l == 8) {
		if($c =~ m/^\s*\$i\s*$/) { # $i
			print "Good ! Continue :)\n\r\n\r";
		} elsif($c =~ m/^\s*print\s+\$i\s*$/) { # print $i
			print "Good ! You printed \$i as string even if it's not obvious :)\n\r\n\r";
		} elsif($c =~ m/^\s*print\s+"\s*\$i\s*"\s*$/) { # print "$i"
			print "Good ! You printed \$i as string, quotes are not needed, print already force string context !\n\r\n\r";
		} elsif($c =~ m/^\s*"\s*\$i\s*"\s*$/) { # "$i"
			print "Good ! You printed \$i as string, quotes force string context !\n\r\n\r";
		} elsif($c =~ m/^\s*\$i\s*\.\s*"\s*\w+\s*"\s*$/) { # $i . "min"
			print "SUCCESS !\n\r\n\r";
		} else {
			print "Try again...\n\r\n\r";
		}
	} elsif($l == 9) {
		if($c =~ m/^\s*\$str\s*=\s*"\s*\d+\s*"\s*$/) { # $str = " 13 "
			print "SUCCESS !\n\r\n\r";
		} elsif($c =~ m/^\s*\$str\s*=/) { # $str =
			print "Take care to correctly fill the str variable with some digits inside quotes...\n\r\n\r";
		} elsif($c =~ m/\s*=\s*"\s*\d\s*"\s*$/) { # = " 13 " 
			print "The variable has to be named \$str...\n\r\n\r";
		} else {
			print "Try again...\n\r\n\r";
		}	
	} elsif($l == 10) {
		if($c =~ m/^\s*\$str\s*$/) { # $str
			print "Good ! Continue :)\n\r\n\r"; 
		} elsif($c =~ m/^\s*print\s+\$str\s*\+\s*\d+\s*$/) { # print $str + 2
			print "Good ! Continue\n\r\n\r";
		} elsif($c =~ m/^\s*print\s+\$str\s*\+\s*\d+?\.\d+?\s*$/) { # print $str + 2.3
			print "Good ! Keep the good fight !\n\r\n\r";
		} elsif($c =~ m/^\s*\$str\s*\+\s*\d+\s*$/) { # $str + 2
			print "Congratulation ! You're a beast !\n\r\n\r";
		} elsif($c =~ m/^\s*\$str\s*\+\s*\d+?\.\d+?\s*$/) { # $str + 2.3
			print "Woow !\n\r\n\r";
		} elsif($c =~ m/^\s*print\s+"\s*\d+\s*"\s*\+\s*\d+?\s*$/) { # print " 11 " + 2
			print "Great ! You get it !\n\r\n\r";
		} elsif($c =~ m/^\s*print\s+"\s*\d+\s*"\s*\+\s*\d+?\.\d+?\s*$/) { # print " 12" + 2.3
			print "Gooood ! Goooood !\n\r\n\r";
		} elsif($c =~ m/^\s*"\s*\d+\s*"\s*\+\s*\d+?\s*$/) { # " 11 " + 2.3
			print "Nice job !\n\r\n\r";
		} elsif($c =~ m/^\s*"\s*\d+\s*"\s*\+\s*\d+?\.\d+?\s*$/) { # " 11 " + 2.3
			print "Really good!\n\r\n\r";
		} elsif($c =~ m/^\s*"\s*\d+\s*"\s*\+\s*"\s*\d+\s*"\s*$/) { # " 11 " + "2"
			print "SUCCESS !\n\r\n\r";
		} elsif($c =~ m/^\s*"\s*\d+\s*"\s*\+\s*"\s*\d+?\.\d+?\s*"\s*$/) { # " 11 " + "2.3"
			print "SUCCESS !\n\r\n\r";
		} else {
			print "Try again...\n\r\n\r";
		}
	} elsif($l == 11) {
		if($c =~ m/^\s*\$tor\s*=\s*"onion "\s*$/) { # $tor = "onion "
			print "SUCCESS !\n\r\n\r";
		} elsif($c =~ m/^\s*\$tor\s*=/) { # $tor = 
			print "Take care to correctly fill the \$tor variable with \"onion \"\n\r\n\r";
		} elsif($c =~ m/\s*=\s*"onion "\s*$/) { # = "onion "
			print "Put \"onion \" inside a variable named \$tor variable\n\r\n\r";
		} else {
			print "Try again...\n\r\n\r";
		}
	} elsif($l == 12) {
		if($c =~ m/^\s*print\s*"\[\$tor\]"\s*$/) { # print "[$tor]"
			print "Good ! Do you noticed the space at the end ?!\n\r\n\r";
		} elsif($c =~ m/^\s*"\[\$tor\]"\s*$/) { # "[$tor]"
			print "Fine ! Do you noticed the space at the end ?!\n\r\n\r";
		} elsif($c =~ m/^\s*chomp\s*\$tor\s*$/) { # chomp $tor
			print "SUCCESS !\n\r\n\r";
		} else {
			print "Try again...\n\r\n\r";
		}
	} elsif($l == 13) {
		if($c =~ m/^\s*print\s*"\(\$tor\)"\s*$/) { # print "($tor)"
			print "Yeah ! The variable no longer contains the trailing space !\n\r\n\r";
		} elsif($c =~ m/^\s*chop\s+\$tor\s*$/) { # chop $tor
			print "SUCCESS !\n\r\n\r";
		} else {
			print "Try again...\n\r\n\r";
		}
	} elsif($l == 14) {
		if($c =~ m/^\s*\@arr\s*=\s*\(\s*"onion"\s*,\s*"c"\s*,\s*"b"\s*,\s*"a"\s*\)\s*$/) { # @arr = ( "onion", "c", "b", "a" )
			print "SUCCESS !\n\r\n\r";
		} elsif($c =~ m/^\s*\@empty\s*=\s*\(\s*\)\s*$/) { # empty = ()
			print "Cool ! An empty array !\n\r\n\r";
		} elsif($c =~ m/^\s*\@arr\s*=/) { # @arr =
			print "Take care to correctly fill the \@arr variable with (\"onion\",\"c\",\"b\",\"a\")\n\r\n\r";
		} elsif($c =~ m/^\s*\@arr\s*/) { # @arr
			print "Good start, please assign something inside \@arr. e.g. (\"onion\",\"c\",\"b\",\"a\")\n\r\n\r";
		} elsif($c =~ m/\s*=\s*\(\s*"onion"\s*,\s*"c"\s*,\s*"b"\s*,\s*"a"\s*\)$/) { # = ( "onion", "c", "b", "a" )
			print "Please name the variable as \@arr\n\r\n\r";
		} else {
			print "Try again...\n\r\n\r";
		}
	} elsif($l == 15) {
		if($c =~ m/^\s*\@arr\s*$/) { # @arr
			print "The value returned is the number of items in the array !\n\r\n\r";
		}elsif($c =~ m/^\s*print\s+\@arr\s*$/) { # print @arr
			print "Yeah ! Here we say to Perl to print array as string !\n\r\n\r";
		} elsif($c =~ m/^\s*scalar\s+\@arr\s*$/) { # scalar @arr
			print "The value returned is the number of items in the array !\n\r\n\r";
		} elsif($c =~ m/^\s*\$#arr\s*$/) { # $#arr
			#print "The value returned is the last index in the array !\n\r\n\r";
			print "SUCCESS !\n\r\n\r";
		} else {
			print "Try again...\n\r\n\r";
		}
	} elsif($l == 16) { 
		if($c =~ m/^\s*shift\s+\@arr\s*$/){ # shift @arr
			print "SUCCESS !\n\r\n\r";
		} elsif($c =~ m/^\s*print\s+\@arr\s*$/){ # print @arr
			print "Yeah ! Everything is well here including the onion !\n\r\n\r";
		} else {
			print "Try again...\n\r\n\r";
		}
	} elsif($l == 17) {
		if($c =~ m/^\s*print\s+\@arr\s*$/){ # print @arr
			print "Good ! Our array now contains cba without any onion !\n\r\n\r";
		} elsif($c =~ m/^\s*pop\s+\@arr\s*$/){ # pop @arr
			print "SUCCESS !\n\r\n\r";
		} else {
			print "Try again...\n\r\n\r";
		}
	} elsif($l == 18) {
		if($c =~ m/^\s*print\s+\@arr\s*$/){ # print @arr
			print "Last item was removed ! \n\r\n\r";
		} elsif($c =~ m/^\s*push\s+\@arr\s*,\s*"a"\s*$/){ # push @arr, "a"
			print "SUCCESS !\n\r\n\r";
		} else {
			print "Try again...\n\r\n\r";
		}
	} elsif($l == 19) {
		if($c =~ m/^\s*push\s+\@arr\s*,\s*\(\s*"x"\s*,\s*"y"\s*,\s*"z"\s*\)\s*$/){ # push @arr, ( "x", "y", "z" )
			print "SUCCESS !\n\r\n\r";
		} elsif($c =~ m/^\s*print\s+\@arr\s*$/){ # print @arr
			print "Good ! Last item is back !\n\r\n\r";
		} elsif($c =~ m/^\s*push\s+\@arr\s*,\s*\(\s*\)\s*$/){ # push @arr, ()
			print "Great ! It's totally useless but it works !\n\r\n\r";
		} else {
			print "Try again...\n\r\n\r";
		}
	} elsif($l == 20) {
		if($c =~ m/^\s*foreach\s+\$v\s+\(\s*\@arr\s*\)\s*\{\s*print\s*\$v\s*\}\s*$/){ # foreach $v (@arr) { print $v }
			print "Good ! You perfectly used foreach ! \n\r\n\r";
		} elsif($c =~ m/^\s*for\s+\$v\s+\(\s*\@arr\s*\)\s*\{\s*print\s*\$v\s*\}\s*$/){ # for $v (@arr) { print $v }
			print "Great ! For could play as a foreach !\n\r\n\r";
		} elsif($c =~ m/^\s*for\s+\$v\s+\(\s*sort\s+\@arr\s*\)\s*\{\s*print\s*\$v\s*\}\s*$/){ # for $v (sort @arr) { print $v }
			print "SUCCESS !\n\r\n\r";
		} elsif($c =~ m/^\s*for\s+\$v\s+\(\s*reverse\s+\@arr\s*\)\s*\{\s*print\s*\$v\s*\}\s*$/){ # for $v (reverse @arr) { print $v }
			print "SUCCESS !\n\r\n\r";
		} else {
			print "Try again...\n\r\n\r";
		}
	} elsif($l == 21) {
		if($c =~ m/^\s*print\s+\@arr\s*$/){ # print @arr
			print "Good ! There's a lot of items in our array now ! \n\r\n\r";
		} elsif($c =~ m/^\s*print\s+\@arr\s*\[\s*0\s*\.\.\s*2\s*\]\s*$/){ # print @arr[0..2]
			print "Great ! You're using perfectly the range operator ! \n\r\n\r";
		} elsif($c =~ m/^\s*\@arr\s*=\s*splice\s+\@arr\s*,\s*0+\s*,\s*0*3\s*$/){ # @arr = splice @arr, 0, 3
			print "SUCCESS !\n\r\n\r";
		} elsif($c =~ m/^\s*\@arr\s*=\s*splice\s+\@arr\s*,\s*\d+\s*,\s*\d+\s*$/){ # @arr = splice @arr, 2, 5
			print "No ! You have to splice with offset 0 and length 3 !\n\r\n\r";
		} elsif($c =~ m/^\s*\@arr\s*=\s*$/){ # @arr = 
			print "No ! You have to use splice like this : splice \@arr,0,3 !\n\r\n\r";
		} else {
			print "Try again...\n\r\n\r";
		}
	
	} elsif($l == 22) {
		if($c =~ m/^\s*\(\s*\$a\s*,\s*\$b\s*,\s*\$c\s*\)\s*=\s*\@arr\s*$/) { # ( $a, $b, $c ) = @arr
			print "SUCCESS !\n\r\n\r";
		} elsif($c =~ m/^\s*\$arr\[[0|1|2]\]\s*$/) { # $arr[1]
			print "Good ! You're accessing an item of the array.\n\r\n\r";
		} else {
			print "Try again...\n\r\n\r";
		}
	} elsif($l == 23) {
		if($c =~ m/^\s*\(\s*\$c\s*,\s*\$a\s*\)\s*=\s*\(\s*\$a\s*,\s*\$c\s*\)\s*$/) { # ( $c, $a ) = ( $a, $c )
			print "SUCCESS !\n\r\n\r";
		} elsif($c =~ m/^\s*\(\s*\$a\s*,\s*\$c\s*\)\s*=\s*\(\s*\$c\s*,\s*\$a\s*\)\s*$/) { # ( $a, $c ) = ( $c, $a )
			print "SUCCESS !\n\r\n\r";
		} elsif($c =~ m/^\s*\$a\s*$/) { # $a
			print "Not hard !\n\r\n\r";
		} elsif($c =~ m/^\s*\$b\s*$/) { # $b
			print "Easy win !\n\r\n\r";
		} elsif($c =~ m/^\s*\$c\s*$/) { # $c
			print "Ok you get it !\n\r\n\r";
		} else {
			print "Try again...\n\r\n\r";
		}
	} elsif($l == 24) {
		if($c =~ m/^\s*print\s+"\s*\$a\s*\$b\s*\$c\s*"\s*$/) { # print $a$b$c
			print "Good ! You're mastering print !\n\r\n\r";
		} elsif($c =~ m/^\s*print\s+\$a\s*,\s*\$b\s*,\s*\$c\s*$/) { # print $a, $b, $c
			print "Great ! You're the print God !\n\r\n\r";
		} elsif($c =~ m/^\s*printf\s*\(\s*"\%s\s*\%s\s*\%s"\s*,\s*\$a\s*,\s*\$b\s*,\s*\$c\s*\)\s*$/) { # printf("%s%s%s", $a, $b, $c)
			print "SUCCESS !\n\r\n\r";
		} else {
			print "Try again...\n\r\n\r";
		}
	} elsif($l == 25) {
		if($c =~ m/^\s*print\s+\@arr\s*$/) { # print @arr
			print "Great ! This array is dirty (sort of)\n\r\n\r";
		} elsif($c =~ m/^\s*print\s*\(\s+sort\s+\@arr\s+\)\s*$/) { # print (sort @arr) 
			print "SUCCESS !\n\r\n\r";
		} else {
			print "Try again...\n\r\n\r";
		}
	} elsif($l == 26) {
		if($c =~ m/^\s*\$arr\[\$#arr\]\s*$/) { # $arr[$#arr]
			print "Good ! You got it !\n\r\n\r";
		} elsif($c =~ m/^\s*\$arr\[-1\]\s*$/) { # $arr[-1] 
			print "Good ! You're becoming a good perl hacker !\n\r\n\r";
		} elsif($c =~ m/^\s*\$arr\[\@arr-1\]\s*$/) { # $arr[@arr-1]
			print "SUCCESS !\n\r\n\r";
		} else {
			print "Try again...\n\r\n\r";
		}
	} elsif($l == 27) {
		if($c =~ m/^\s*join\(","\s*,\s*\@arr\s*\)\s*$/) { # join(",", @arr)
			print "Good ! Join join join :)\n\r\n\r";
		} elsif($c =~ m/^\s*join ","\s*,\s*\@arr\s*\s*$/) { # join ",", @arr
			print "Great ! Join join join :D\n\r\n\r";
		} elsif($c =~ m/^\s*join\(" <--> "\s*,\s*\@arr\s*\)\s*$/) { # join(" <--> ", @arr)
			print "SUCCESS !\n\r\n\r";
		} elsif($c =~ m/^\s*join " <--> "\s*,\s*\@arr\s*\s*$/) { # join " <--> ", @arr
			print "SUCCESS !\n\r\n\r";
		} else {
			print "Try again...\n\r\n\r";
		}
	
	} elsif($l == 28) {
		if($c =~ m/^\s*join\(\s*"-"\s*,\s*split\(\s*","\s*,\s*"\w+,\w+,\d+"\s*\)\s*\)\s*$/) { # join("-", split(",", "john,doe,30"))
			print "Good ! You split , then joined with dashes !\n\r\n\r";
		} elsif($c =~ m/^\s*join\(\s*"-"\s*,\s*split\(\s*"::"\s*,\s*"\w+::\w+::\d+"\s*\)\s*\)\s*$/) { # join("-", split(",", "john::doe::30"))
			print "Yeah ! You split :: then joined with dashes !\n\r\n\r";
		} elsif($c =~ m/^\s*join\(\s*"-"\s*,\s*split\(\s*","\s*,+\s*"\w+,+\w+,+\d+,*"\s*\)\s*\)\s*$/) { # join("-", split(",", "john,,doe,30,,,"))
			print "Wow ! It's really convenient isn't it ?\n\r\n\r";
		} elsif($c =~ m/^\s*\(\s*\$f\s*,\s*\$l\s*,\s*\$a\s*\)\s*=\s*split\(\s*","\s*,\s*"\w+,\w+,\d+"\s*\)\s*$/) { # ($f, $l, $a) = join("-", split(",", "john,doe,30,"))
			print "SUCCESS !\n\r\n\r";
		} else {
			print "Try again...\n\r\n\r";
		}
	} elsif($l == 29) {
		if($c =~ m/^\s*print\s+"\s*\$f\s*\$l\s*\$a\s*"\s*$/) { # print "$f$l$a"
			print "SUCCESS !\n\r\n\r";
		} else {
			print "Try again...\n\r\n\r";
		}
	} elsif($l == 30) {
		if($c =~ m/^\s*if\s*\(\s*1\s*\)\s*\{\s*print\s*"\s*\w+\s*"\s*\}\s*$/) { # if(1) { print "onion" } 
			print "SUCCESS !\n\r\n\r";
		} else {
			print "Try again...\n\r\n\r";
		}
	} elsif($l == 31) {
		if($c =~ m/^\s*do\s*\{\s*print\s+"\w+"\s*\}\s*if\s+1\s*$/) { # do { print "onion" } if 1
			print "Do it ! Do it !\n\r\n\r";
		} elsif($c =~ m/^\s*print\s+"\s*\w+\s*"\s+if\s+not\s+0\s*$/) { # do { print "onion" } if 0
			print "SUCCESS !\n\r\n\r";
		} elsif($c =~ m/^\s*do\s*\{\s*print\s+"\w+"\s*\}\s*unless\s+0\s*$/) { # do { print "onion" } unless 0
			print "Do it again !\n\r\n\r";
		} else {
			print "Try again...\n\r\n\r";
		}
	} elsif($l == 32) {
		if($c =~ m/^\s*\!\s*\(\s*0\s+or\s+"0"\s+or\s+0\.0\s+or\s+undef\s+or\s+\(\s*\)\s*\)\s*and\s+print\s+"\s*\w+\s*"\s*$/) { # !(0 or "0" or 0.0 or undef or ()) and print "false"
			print "Wow ! What a long command for a summary ! I'm impressed that you typed it !\n\r\n\r";
		} elsif($c =~ m/^\s*"\s+"\s+and\s+"\d+\.\d+"\s+and\s+1\s+and\s+"\s*\w+\s*"\s+and\s+print\s+"\s*\w+\s*"\s*$/) { # " " and "0.0" and 1 and "banana" and print "true" 
			print "SUCCESS !\n\r\n\r";
		# Actually I no longer ask user to type these following statements, but regex are still here at the moment
		} elsif($c =~ m/^\s*do\s*\{\s*print\s+"\w+"\s*\}\s*unless\s+"0"\s*$/) { # do { print "onion" } unless "0" 
			print "Good ! \"0\" is false !\n\r\n\r";
		} elsif($c =~ m/^\s*do\s*\{\s*print\s+"\w+"\s*\}\s*unless\s+0\s*$/) { # do { print "onion" } unless 0 
			print "Good ! 0 is false !\n\r\n\r";
		} elsif($c =~ m/^\s*do\s*\{\s*print\s+"\w+"\s*\}\s*unless\s+0+\.0+\s*$/) { # do { print "onion" } unless 0.0 
			print "Good ! 0.0 is false !\n\r\n\r";
		} elsif($c =~ m/^\s*do\s*\{\s*print\s+"\w+"\s*\}\s*unless\s+undef+\s*$/) { # do { print "onion" } unless undef 
			print "Good ! 0.0 is false !\n\r\n\r";
		} elsif($c =~ m/^\s*do\s*\{\s*print\s+"\w+"\s*\}\s*unless\s+"0.0"+\s*$/) { # do { print "onion" } unless "0.0" 
			print "Good ! \"0.0\" is true !\n\r\n\r";
		} elsif($c =~ m/^\s*do\s*\{\s*print\s+"\w+"\s*\}\s*unless\s+""+\s*$/) { # do { print "onion" } unless "" 
			print "Good ! \"\" is false !\n\r\n\r";
		} elsif($c =~ m/^\s*do\s*\{\s*print\s+"\w+"\s*\}\s*unless\s+\(\s*\)+\s*$/) { # do { print "onion" } unless () 
			print "Good ! Empty array () is false !\n\r\n\r";
		} elsif($c =~ m/^\s*do\s*\{\s*print\s+"\w+"\s*\}\s*if\s+"\s+"\s*$/) { # do { print "onion" } if " "
			print "Good ! \" \" is true !\n\r\n\r";
		} elsif($c =~ m/^\s*do\s*\{\s*print\s+"\w+"\s*\}\s*if\s+1+\s*$/) { # do { print "onion" } if 1 
			print "Good ! 1 is true !\n\r\n\r";
		} elsif($c =~ m/^\s*do\s*\{\s*print\s+"\w+"\s*\}\s*if\s+"\s*[123456789]+[0123456789]*\s*"+\s*$/) { # do { print "onion" } if "0123" 
			print "Good ! \"1\" is true !\n\r\n\r";
		} elsif($c =~ m/^\s*do\s*\{\s*print\s+"\w+"\s*\}\s*if\s+"\s*[0123456789]*[123456789]+\s*"+\s*$/) { # do { print "onion" } if "1000" 
			print "Good ! \"1\" is true !\n\r\n\r";
		} elsif($c =~ m/^\s*do\s*\{\s*print\s+"\w+"\s*\}\s*if\s+"\s*\w+\s*"+\s*$/) { # do { print "onion" } unless "0" 
			print "Good ! Various other strings are true !\n\r\n\r";
		} else {
			print "Try again...\n\r\n\r";
		}
	} elsif($l == 33) {
		if($c =~ m/^\s*1\s+and\s+print\s+"onion"\s*$/) { # 1 and print "onion"
			print "Yeah ! onion onion onion !\n\r\n\r";
		} elsif($c =~ m/^\s*1\s+&&\s+print\s+"onion"\s*$/) { # 1 && print "onion"
			print "Yeah ! onion and chunky bacon (c) !\n\r\n\r";
		} elsif($c =~ m/^\s*0\s+or\s+print\s+"onion"\s*$/) { # 0 or print "onion"
			print "Yeah ! onioooon !\n\r\n\r";
		} elsif($c =~ m/^\s*0\s+\|\|\s+print\s+"onion"\s*$/) { # 0 || print "onion"
			print "Yeah ! I like onions and you ?!\n\r\n\r";
		} elsif($c =~ m/^\s*0\s+and\s+print\s+"\s*banana\s*"\s+or\s+print\s+"\s*onion\s*"\s*$/) { # 0 and print "bananas" or print "onion"
			print "SUCCESS !\n\r\n\r";
		} else {
			print "Try again...\n\r\n\r";
		}
	} elsif($l == 34) {
		if($c =~ m/^\s*0\s*\?\s*print\s+"\s*true\s*"\s*:\s*print\s+"\s*false\s*"\s*$/) { # 0 ? print "true" : print "false"
			print "Good ! You perfectly used ternary operator !\n\r\n\r";
		} elsif($c =~ m/^\s*1\s*\?\s*print\s+"\s*true\s*"\s*:\s*print\s+"\s*false\s*"\s*$/) { # 1 ? print "true" : print "false"
			print "SUCCESS !\n\r\n\r";
		} else {
			print "Try again...\n\r\n\r";
		}
	} elsif($l == 35) {
		if($c =~ m/^\s*\%empty\s*=\s*\(\s*\)\s*$/) { # @empty = ()
			print "Cool ! An empty hash ! Note that we actually initialized it with an empty array !\n\r\n\r";
		} elsif($c =~ m/\s*\%h\s*=\s*\(\s*key1\s*=>\s*"val1"\s*,\s*key2\s*=>\s*"val2"\s*\)$/) { # %h = ( key1 => "val1", key2 => "val2" ) 
			print "SUCCESS !\n\r\n\r";
		} elsif($c =~ m/^\s*\%h\s*=/) { # %h =
			print "Take care to correctly fill the \%h variable with ( key1 => \"val1\" , key2 => \"val2\" )\n\r\n\r";
		} elsif($c =~ m/^\s*\%h\s*/) { # %h
			print "Good start, but please assign ( key1 => \"val1\" , key2 => \"val2\" ) to %h\n\r\n\r"; 
		} elsif($c =~ m/\s*=\s*\(\s*key1\s*=>\s*"val1"\s*,\s*key2\s*=>\s*"val2"\s*\)$/) { # = ( key1 => "val1", key2 => "val2" ) 
			print "Please name the variable as \%h\n\r\n\r";
		} else {
			print "Try again...\n\r\n\r";
		}
	} elsif($l == 36) {
		if($c =~ m/^\s*print\s+\%h\s*$/) { # print %h
			print "SUCCESS !\n\r\n\r";
		} elsif($c =~ m/^\s*\$h\s*\{\s*"key[1|2]"\s*\}\s*$/) { # $h{"key1"}
			print "Good ! This is easy right ?\n\r\n\r";
		} elsif($c =~ m/^\s*\$h\s*\{\s*'key[1|2]'\s*\}\s*$/) { # $h { "key1" }
			print "Nice shot ! Works with simple quote ! Yeah !\n\r\n\r";
		} elsif($c =~ m/^\s*\$h\s*\{\s*key[1|2]\s*\}\s*$/) { # $h{key1}
			print "Great ! Works even without any quotes ?\n\r\n\r";
		} else {
			print "Try again...\n\r\n\r";
		}
	} elsif($l == 37) {
		if($c =~ m/^\s*print\s+join\s+"-"\s*,\s*\%h\s*$/) { # print join "-", %h
			print "Cool ! Join works also here !\n\r\n\r";
		} elsif($c =~ m/^\s*print\s+keys\s+\%h\s*$/) { # print keys %h
			print "Good ! You're listing the hash keys !\n\r\n\r";
		} elsif($c =~ m/^\s*print\s+values\s+\%h\s*$/) { # print values %h
			print "SUCCESS !\n\r\n\r";
		} else {
			print "Try again...\n\r\n\r";
		}
	} elsif($l == 38) {
		if($c =~ m/^\s*\\\$\w+\s*$/) { # \$s
			print "Yeah ! Perl tells you it's a scalar !\n\r\n\r";
		} elsif($c =~ m/^\s*\\\@\w+\s*$/) { # \@a
			print "Good ! Perl tells you it's an array !\n\r\n\r";
		} elsif($c =~ m/^\s*\\\%\w+\s*$/) { # \%h
			print "Nice ! Perl tells you it's an hash !\n\r\n\r";
		} elsif($c =~ m/^\s*\\\\\$\w+\s*$/) { # \\$s
			print "SUCCESS !\n\r\n\r";
		} elsif($c =~ m/^\s*\\\\\@\w+\s*$/) { # \\@a
			print "SUCCESS !\n\r\n\r";
		} elsif($c =~ m/^\s*\\\\\%\w+\s*$/) { # \\%h
			print "SUCCESS !\n\r\n\r";
		} else {
			print "Try again...\n\r\n\r";
		}
	} elsif($l == 39) {
		if($c =~ m/^\s*\\\\+\$\w+\s*$/) { # \\\\\\$s
			print "Curious ! But works !\n\r\n\r";
		} elsif($c =~ m/^\s*\\\\+\@\w+\s*$/) { # \\\\\\@a
			print "Strange ! But works !\n\r\n\r";
		} elsif($c =~ m/^\s*\\\\+\%\w+\s*$/) { # \\\\\\%a
			print "SUCCESS !\n\r\n\r";
		} else {
			print "Try again...\n\r\n\r";
		}
	} elsif($l == 40) {
		if($c =~ m/^\s*print\s+\%\s*\{\s*\\\%h\s*\}\s*$/) { # print %{ \%h }
			print "SUCCESS !\n\r\n\r";
		} elsif($c =~ m/^\s*print\s+\@\s*\{\s*\\\@arr\s*\}\s*$/) { # print @{ \@a }
			print "Great ! You referenced the dereferenced an array !\n\r\n\r";
		} else {
			print "Try again...\n\r\n\r";
		}
	} elsif($l == 41) {
		if($c =~ m/^\s*sub\s+f1\s*\(\s*\)\s*\{\s*print\s+"\s*\w+\s*"\s*\}\s*f1\s*\(\s*\)\s*$/) { # sub f1() { print "f1" } f1()
			print "Good ! Your first Perl sub declaration/definition !\n\r\n\r";
		} elsif($c =~ m/^\s*sub\s+f2\s*\{\s*print\s+"\s*\w+\s*"\s*\}\s*f2\s*\(\s*"\s*\w+\s*"\s*\)\s*$/) { # sub f2 { print "f2" } f2("a")
			print "Good ! Perl sub declaration is flexible !\n\r\n\r";
		} elsif($c =~ m/^\s*\\\&\w+\s*$/) { # \&c
			print "Nice ! Perl tells you it's a piece of code !\n\r\n\r";
		} elsif($c =~ m/^\s*sub\s+f3\s*\(\s*\$;\$+\s*\)\s*\{\s*print\s+"\s*\w+\s*"\s*\}\s*f3\s*\(\s*"\s*\w+\s*"\s*,\s*"\s*\w+\s*"\s*\)\s*$/) { # sub f3($;$$) { print "f3" } f3("a","b")
			print "Yeah ! Perl is super flexible ! I love it !\n\r\n\r";
		} elsif($c =~ m/^\s*\&\s*\{\s*sub\s*\{\s*print\s+"\s*\w+\s*"\s*\}\s*\}\s*\(\s*\)\s*$/) { # & { sub { print "f4" }}() 
			print "SUCCESS !\n\r\n\r";
		} else {
			print "Try again...\n\r\n\r";
		}
	} elsif($l == 42) {
		if($c =~ m/^\s*grep\s*\{\s*\/onion\/\s*\}\s+"\s*onion\s*\w+\s*\w+\s*"\s+and\s+print\s+"\s*\w+\s*\w+"\s*$/) { # grep {/onion/} "onion and bacon" and print "get it" 
			print "Wow ! Our grep matched the onion !\n\r\n\r";
		} elsif($c =~ m/^\s*if\s*\(\s*"onion"\s*=~\s*\/nio\/\s*\)\s*\{\s*print\s*"\s*\w+\s*"\s*\}\s*$/) { # if ("onion" =~ m/no/) { print "match"}	
			print "SUCCESS !\n\r\n\r";
		} else {
			print "Try again...\n\r\n\r";
		}
	} elsif($l == 43) {
		if($c =~ m/^\s*print\s+map\s*\{\s*ucfirst\s+\$_\s*\}\s*\(\s*"\w+"\s*,\s*"\w+"\s*,\s*"\w+"\s*\)\s*$/) { # print map {ucfirst $_} ("aa", "bb", "cc") 
			print "SUCCESS !\n\r\n\r";
		} else {
			print "Try again...\n\r\n\r";
		}
	} elsif($l == 44) {
		if($c =~ m/^\s*\$\_\s*=\s*"Jvtu bopuifs Pfsm ibdlfs"; y\/a-z\/za-y\/\;\s*print\s*$/){ # $_ = "Jvtu bopuifs Pfsm ibdlfs"; y/a-z/za-y/; print
			print "SUCCESS !\n\r\n\r";
		} else {
			print "Try again...\n\r\n\r";
		}

	
	}

	 
}

$| = 1; # Force flush

# Redirect output
my $output;
open(my $outputFH, '>', \$output) or die; # This shouldn't fail
my $oldFH = select $outputFH;

my $compartment = new Safe("Jail");
$compartment->deny(qw(:base_io :ownprocess :subprocess :filesys_read :sys_db :filesys_open :filesys_write :dangerous));
$compartment->permit(qw(:base_math print say pack unpack require caller sort));

#$Jail::var = "toto    ";
init($lesson);

my $ret;

# This eval is for timeout 
eval {
	local $SIG{ALRM} = sub { print "Oh fuck ! We reached the timeout ! Fuck fuck fuck !"; die "alarm\n" }; # print captured into $ret as everything else due to select !
	alarm 3; # 3 sec
	$ret = $compartment->reval($cmd); # This reval is for code execution
	alarm 0;
};

# Exception 
my $e = $@;

select $oldFH;
close $outputFH;

if($e) {
	print "exception\n\r";
	print "=> $@\n\r";	
} elsif($output) {
	print "=> $output\n\r";
} else{ 
	print "=> $ret\n\r";
}

# Uncomment for debugging purpose only, it breaks the app
$verbose and 
print "[$output][$ret]\n\r\n\r" ;
success($lesson, $cmd);





