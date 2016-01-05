#!/usr/bin/env perl

# Inits here 

sub answer($) {
	my $c = shift;
	if($c =~ m/^\s*grep\s*\{\s*\/onion\/\s*\}\s+"\s*onion\s*\w+\s*\w+\s*"\s+and\s+print\s+"\s*\w+\s*\w+"\s*$/) { # grep {/onion/} "onion and bacon" and print "get it" 
		return "Wow ! Our grep matched the onion !\n\r\n\r";
	} elsif($c =~ m/^\s*if\s*\(\s*"onion"\s*=~\s*\/nio\/\s*\)\s*\{\s*print\s*"\s*\w+\s*"\s*\}\s*$/) { # if ("onion" =~ m/no/) { print "match"}	
		return "SUCCESS !\n\r\n\r";
	} else {
		return "Try again...\n\r\n\r";
	}
}

1;

__DATA__
<h1>Grep</h1>
<h2>Introduction to regex</h2>

Perl is well known to be the best language to use with regular expression.<br/>
Perl even produced standard <strong>PCRE</strong> which stands for <u>Perl Compatible Regular Expression</u> !<br/><br/>
First we will start with a grep : <br/><br/>
Please type <code>grep {/onion/} "onion and bacon" and print "get it"</code><br/><br/>

There's also another way to test a string, please try :<br/><code>if ("onion" =~ /nio/) { print "match"}</code>

