#!/usr/bin/env perl

# Inits here 

sub answer($) {
	my $c = shift;
	if($c =~ m/^\s*\@arr\s*=\s*\(\s*"onion"\s*,\s*"c"\s*,\s*"b"\s*,\s*"a"\s*\)\s*$/) { # @arr = ( "onion", "c", "b", "a" )
		return "SUCCESS !\n\r\n\r";
	} elsif($c =~ m/^\s*\@empty\s*=\s*\(\s*\)\s*$/) { # empty = ()
		return "Cool ! An empty array !\n\r\n\r";
	} elsif($c =~ m/^\s*\@arr\s*=/) { # @arr =
		return "Take care to correctly fill the \@arr variable with (\"onion\",\"c\",\"b\",\"a\")\n\r\n\r";
	} elsif($c =~ m/^\s*\@arr\s*/) { # @arr
		return "Good start, please assign something inside \@arr. e.g. (\"onion\",\"c\",\"b\",\"a\")\n\r\n\r";
	} elsif($c =~ m/\s*=\s*\(\s*"onion"\s*,\s*"c"\s*,\s*"b"\s*,\s*"a"\s*\)$/) { # = ( "onion", "c", "b", "a" )
		return "Please name the variable as \@arr\n\r\n\r";
	} else {
		return "Try again...\n\r\n\r";
	}
}

1;

__DATA__
<h1>Arrays !</h1>

<h2>About arrays</h2>

Yet you know that Perl variables names have a special character as a prefix...
Arrays are respecting the rules and the symbol is ??? <br/>I let you guess...<br/><br/>
Please make an effort...<br/><br/>
One clue, think that for <u>S</u>calar it was a <u>S</u>, so for <u>A</u>rray it should be ... A !<br/><br/>

It's not exactly <strong>A</strong> actually but <strong>@</strong> but that's easy to remember !

<h2>Declare a new array</h2>

Start with an empty array <code>@empty = ()</code><br/><br/>

Then I let you create a second (non empty) array called <strong>@arr</strong> like this <code>@arr = ("onion","c","b","a")</code><br/> 

