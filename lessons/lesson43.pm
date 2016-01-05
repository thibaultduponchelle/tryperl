#!/usr/bin/env perl

# Inits here 

sub answer($) {
	my $c = shift;
		if($c =~ m/^\s*print\s+map\s*\{\s*ucfirst\s+\$_\s*\}\s*\(\s*"\w+"\s*,\s*"\w+"\s*,\s*"\w+"\s*\)\s*$/) { # print map {ucfirst $_} ("aa", "bb", "cc") 
		return "SUCCESS !\n\r\n\r";
	} else {
		return "Try again...\n\r\n\r";
	}
}

1;

__DATA__
<h1>World map</h1>
<h2>Introduction to map</h2>

Perl provides a command to apply an action to a list of data. It's called <strong>map</strong> !<br/><br/>

Please give it a try with <code>print map {ucfirst $_} ("aa", "bb", "cc")</code><br/><br/>

Oh, wait, I need to explain what is <strong>$_</strong> ?!<br/><br/>
It's only the current item !<br/>

