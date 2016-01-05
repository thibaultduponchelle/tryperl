#!/usr/bin/env perl

# Inits here 
$jail::i = 42;    # First declaration of a number

sub answer($) {
	my $c = shift;
	if($c =~ m/^\s*\$i\s*$/) { # $i
		return "Good ! Continue :)\n\r\n\r";
	} elsif($c =~ m/^\s*print\s+\$i\s*$/) { # print $i
		return "Good ! You printed \$i as string even if it's not obvious :)\n\r\n\r";
	} elsif($c =~ m/^\s*print\s+"\s*\$i\s*"\s*$/) { # print "$i"
		return "Good ! You printed \$i as string, quotes are not needed, print already force string context !\n\r\n\r";
	} elsif($c =~ m/^\s*"\s*\$i\s*"\s*$/) { # "$i"
		return "Good ! You printed \$i as string, quotes force string context !\n\r\n\r";
	} elsif($c =~ m/^\s*\$i\s*\.\s*"\s*\w+\s*"\s*$/) { # $i . "min"
		return "SUCCESS !\n\r\n\r";
	} else {
		return "Try again...\n\r\n\r";
	}
}

1;

__DATA__
<h1>itoa</h1>

<h2>Implicit conversion to string</h2>

Check the content of $i like this : <code>$i</code>.<br/><br/>

Now use implicit conversion like this <code>print $i</code><br/> 
(<strong>print</strong> force string context)<br/><br/>

Or use <code>"$i"</code> in this case this is the <strong>quotes</strong> that are forcing string context.<br/><br/>

Another method is to use concatenation so it force string context like this <code>$i . "min"</code> 

