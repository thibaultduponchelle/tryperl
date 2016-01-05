#!/usr/bin/env perl

# Inits here 

sub answer($) {
	my $c = shift;
	if($c =~ m/^\s*do\s*\{\s*print\s+"\w+"\s*\}\s*if\s+1\s*$/) { # do { print "onion" } if 1
		return "Do it ! Do it !\n\r\n\r";
	} elsif($c =~ m/^\s*print\s+"\s*\w+\s*"\s+if\s+not\s+0\s*$/) { # do { print "onion" } if 0
		return "SUCCESS !\n\r\n\r";
	} elsif($c =~ m/^\s*do\s*\{\s*print\s+"\w+"\s*\}\s*unless\s+0\s*$/) { # do { print "onion" } unless 0
		return "Do it again !\n\r\n\r";
	} else {
		return "Try again...\n\r\n\r";
	}
}

1;

__DATA__
<h1>Do if unless</h1>

<h2>Just do it !</h2>
Perl true and false is intuitive...<br/>
Consider only what is <strong>false</strong> and deduce that everything else is <strong>true</strong><br/><br/>
Note that <strong>not</strong> or <strong>!</strong> (exclamation mark) are returning the logical negation.<br/>
To test true and false values, please welcome <strong>do if</strong> construction !<br/><br/>

First type <code>do { print "onion" } if 1</code><br/><br/>

The exact contrary is unless: <code>do { print "onion" } unless 0</code><br/><br/>

Same construction apply <i>without</i> the <strong>do</strong>, for instance you could try <strong>not</strong> with <code>print "onion" if not 0</code><br/>

