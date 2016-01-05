#!/usr/bin/env perl

# Inits here 

sub answer($) {
	my $c = shift;
	if($c =~ m/^\s*lc\s+"\w+"\s*$/) { # lc "onion"
		return "SUCCESS !\n\r\n\r";
	} elsif($c =~ m/^\s*uc\s+"\w+"\s*$/) { # uc "onion"
		return "SUCCESS !\n\r\n\r";
	} else {
		return "Try again...\n\r\n\r";
	}
}

1;

__DATA__
<h1>Uppercase</h1>

<h2>Simple things stay easy with Perl</h2>
Perl won't force you to manipulate ASCII values. Perl is convenient because it already provides builtins to handle it for you.<br/><br/>
And it's easy, and builtins do what they sound like to do.<br/><br/>

Please make me happy by typing <code>uc "onion"</code> or <code>lc "OnIoN"</code>...<br/><br/>

...Or eventually another string if you really does not like onions,<br/>for instance <code>uc "banana"</code> is ok for me).<br/>

