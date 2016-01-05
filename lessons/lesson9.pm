#!/usr/bin/env perl

# Inits here 

sub answer($) {
	my $c = shift;
	if($c =~ m/^\s*\$str\s*=\s*"\s*\d+\s*"\s*$/) { # $str = " 13 "
		return "SUCCESS !\n\r\n\r";
	} elsif($c =~ m/^\s*\$str\s*=/) { # $str =
		return "Take care to correctly fill the str variable with some digits inside quotes...\n\r\n\r";
	} elsif($c =~ m/\s*=\s*"\s*\d\s*"\s*$/) { # = " 13 " 
		return "The variable has to be named \$str...\n\r\n\r";
	} else {
		return "Try again...\n\r\n\r";
	}	
}

1;

__DATA__
<h1>Small strings</h1>

<h2>Your first perl string variable</h2>

A scalar variable could contain a string.<br/><br/>
Honestly your variables will contain very often strings, because programmers deals a lot with <strong>strings</strong>.<br/><br/>

To prepare next lesson, please put digits between quotes (here : 13), it will still be a string anyway as they are between quotes !<br/><br/>

Declare a string like this : <code>$str = "  13 "</code>

