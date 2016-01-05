#!/usr/bin/env perl

# Inits here 
$jail::h{'key1'} = "val1"; # Print values 
$jail::h{'key2'} = "val2"; # Unsing values and join

sub answer($) {
	my $c = shift;
	if($c =~ m/^\s*print\s+join\s+"-"\s*,\s*\%h\s*$/) { # print join "-", %h
		return "Cool ! Join works also here !\n\r\n\r";
	} elsif($c =~ m/^\s*print\s+keys\s+\%h\s*$/) { # print keys %h
		return "Good ! You're listing the hash keys !\n\r\n\r";
	} elsif($c =~ m/^\s*print\s+values\s+\%h\s*$/) { # print values %h
		return "SUCCESS !\n\r\n\r";
	} else {
		return "Try again...\n\r\n\r";
	}
}

1;

__DATA__
<h1>Hashes of onions</h1>
<h2>Keys and values</h2>

Note that <strong>join</strong> also works on <strong>hashes</strong> so <code>print join "-",%h</code> will produce what we want.<br/><br/>

What if we only want keys ?<br/>
To do so, use a <code>print keys %h</code><br/><br/>

Same for values ?<br/>
<code>print values %h</code> !<br/><br/>

<u>NOTA BENE</u> : an hash does not preserve any (insertion) order but put data in a special way (internally) to access it quickly. It means that you often have to do your own sorting !<br/>

