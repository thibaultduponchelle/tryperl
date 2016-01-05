#!/usr/bin/env perl

# Inits here 
$jail::tor = "onion\n"; # With a trailing carriage return

sub answer($) {
	my $c = shift;
	if($c =~ m/^\s*print\s*"\[\$tor\]"\s*$/) { # print "[$tor]"
		return "Good ! Do you noticed the carriage return at the end ?!\n\r\n\r";
	} elsif($c =~ m/^\s*"\[\$tor\]"\s*$/) { # "[$tor]"
		return "Fine ! Do you noticed the carriage return at the end ?!\n\r\n\r";
	} elsif($c =~ m/^\s*chomp\s*\$tor\s*$/) { # chomp $tor
		return "SUCCESS !\n\r\n\r";
	} else {
		return "Try again...\n\r\n\r";
	}
}

1;

__DATA__
<h1>Ready, steady, Chomp !</h1>

<h2>Check our dirty Tor</h2>

Then we have to check what our <strong>$tor</strong> variable contains...<br/><br/>
To do so, use <code>print "[$tor]"</code> or <code>"[$tor]"</code>

<h2>Finally chomp ! </h2>

Ok our variable is ready with an extra carriage return at the end...<br/><br/>
Now we need to remove this trailing character, let's execute <code>chomp $tor</code>.

