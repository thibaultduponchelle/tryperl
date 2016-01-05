#!/usr/bin/env perl

# Inits here 
$jail::tor = "onion"; # Space chomped

sub answer($) {
	my $c = shift;
	if($c =~ m/^\s*print\s*"\(\$tor\)"\s*$/) { # print "($tor)"
		return "Yeah ! The variable no longer contains the trailing carriage return !\n\r\n\r";
	} elsif($c =~ m/^\s*chop\s+\$tor\s*$/) { # chop $tor
		return "SUCCESS !\n\r\n\r";
	} else {
		return "Try again...\n\r\n\r";
	}
}

1;

__DATA__
<h1>Chomp over there</h1>

<h2>Conclusion about chomp</h2>

We will close these samples around chomp by checking the final content of our <strong>$tor</strong> variable.<br/><br/>
Please check that tariling carriage return was removed with <code>print "($tor)"</code>.

<h2>Chop</h2>
There's a <i>bazooka</i> version of <strong>chomp</strong> that is called <strong>chop</strong>.<br/><br/>
<strong>chop</strong> does not care about the character but chop in any case !<br/>
For instance, if you start <code>chop $tor</code> it will crop the last <strong>"n"</strong> from "onion" in the variable <strong>$tor</strong> !<br/>
(Note that it would have worked with a space)

