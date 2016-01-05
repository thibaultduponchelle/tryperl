#!/usr/bin/env perl

# Inits here 

sub answer($) {
	my $c = shift;
	if($c =~ m/^\s*if\s*\(\s*1\s*\)\s*\{\s*print\s*"\s*\w+\s*"\s*\}\s*$/) { # if(1) { print "onion" } 
		return "SUCCESS !\n\r\n\r";
	} else {
		return "Try again...\n\r\n\r";
	}
}

1;

__DATA__
<h1>Conditions</h1>
<h2>if-then-else !</h2>
We are not going to do too much things if we are not able to execute code upon conditions...<br/><br/>

No surprise, Perl provides the famous <strong>if then else</strong> :<br/>
<code>if (1) { print "onion" }</code><br/><br/>

Some things to remember : 
<ul>
<li>You have to put <u>braces</u> (<strong>if(1) print "stuff"</strong> is simply invalid)</li>
<li>The keyword to combine else <i>and</i> if is <strong>elsif</strong></u></li>
</ul>

