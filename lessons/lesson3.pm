#!/usr/bin/env perl

# Inits here 

sub answer($) {
	my $c = shift;
	if($c =~ m/^\s*length\s+"\s*\w+\s*"\s*$/) { # length "banana"
		return "Nice job ! I know that you like bananas !\n\r\n\r";
	} elsif($c =~ m/^\s*length\s+\d+\s*$/) { # length 123
		return "Yeah ! It works even with numbers !\n\r\n\r";
	} elsif($c =~ m/^\s*length\s+\d+\.0+\s*$/) { # length 123.00
		return "SUCCESS !\n\r\n\r";
	} else {
		return "Try again...\n\r\n\r";
	}
}

1;

__DATA__
<h1>Length</h1>
<h2>String length</h2>

You could retrieve the length of a string like this <code>length "banana"</code> (yes we now replaced onion per banana after eating onion for several lessons).<br/><br/>

As always, we could apply length operator on number because perl will implicitely convert number to a string : <code>length 123</code><br/><br/>

For completeness, please try something else before to continue <code>length 123.00</code><br/>
(length requests a string so 123.00 is converted to 123 !)

