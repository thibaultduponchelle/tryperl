#!/usr/bin/env perl

# Inits here 
$jail::str = " 13 "; # String easy to convert to number

sub answer($) {
	my $c = shift;
	if($c =~ m/^\s*\$str\s*$/) { # $str
		return "Good ! Continue :)\n\r\n\r"; 
	} elsif($c =~ m/^\s*print\s+\$str\s*\+\s*\d+\s*$/) { # print $str + 2
		return "Good ! Continue\n\r\n\r";
	} elsif($c =~ m/^\s*print\s+\$str\s*\+\s*\d+?\.\d+?\s*$/) { # print $str + 2.3
		return "Good ! Keep the good fight !\n\r\n\r";
	} elsif($c =~ m/^\s*\$str\s*\+\s*\d+\s*$/) { # $str + 2
		return "Congratulation ! You're a beast !\n\r\n\r";
	} elsif($c =~ m/^\s*\$str\s*\+\s*\d+?\.\d+?\s*$/) { # $str + 2.3
		return "Woow !\n\r\n\r";
	} elsif($c =~ m/^\s*print\s+"\s*\d+\s*"\s*\+\s*\d+?\s*$/) { # print " 11 " + 2
		return "Great ! You get it !\n\r\n\r";
	} elsif($c =~ m/^\s*print\s+"\s*\d+\s*"\s*\+\s*\d+?\.\d+?\s*$/) { # print " 12" + 2.3
		return "Gooood ! Goooood !\n\r\n\r";
	} elsif($c =~ m/^\s*"\s*\d+\s*"\s*\+\s*\d+?\s*$/) { # " 11 " + 2.3
		return "Nice job !\n\r\n\r";
	} elsif($c =~ m/^\s*"\s*\d+\s*"\s*\+\s*\d+?\.\d+?\s*$/) { # " 11 " + 2.3
		return "Really good!\n\r\n\r";
	} elsif($c =~ m/^\s*"\s*\d+\s*"\s*\+\s*"\s*\d+\s*"\s*$/) { # " 11 " + "2"
		return "SUCCESS !\n\r\n\r";
	} elsif($c =~ m/^\s*"\s*\d+\s*"\s*\+\s*"\s*\d+?\.\d+?\s*"\s*$/) { # " 11 " + "2.3"
		return "SUCCESS !\n\r\n\r";
	} else {
		return "Try again...\n\r\n\r";
	}
}

1;

__DATA__
<h1>And atoi !</h1>

<h2>Explicit conversion to number</h2>

Check the content of <strong>$str</strong> like this : <code>$str</code><br/><br/>

Now use explicit conversion like this <code>$str + 0.1</code> or <code>" 40 " + 2.0</code><br/>
Note that it will work with a <strong>print</strong> like <code>print " 38" + 4</code><br/>
In this case you explicitly reconvert to string after addition.<br/><br/>

Note that it is the operator that force conversion, so <code>"41" + "1"</code> will produce a number with the result that we expect !

<h2>Tips</h2>
You could use this trick to convert to number by adding 0...<br/>
Or you could use sprintf !<br/>

