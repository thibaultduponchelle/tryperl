#!/usr/bin/env perl

# Inits here 

sub answer($) {
	my $c = shift;
	if($c =~ m/^\s*0\s*\?\s*print\s+"\s*true\s*"\s*:\s*print\s+"\s*false\s*"\s*$/) { # 0 ? print "true" : print "false"
		return "Good ! You perfectly used ternary operator !\n\r\n\r";
	} elsif($c =~ m/^\s*1\s*\?\s*print\s+"\s*true\s*"\s*:\s*print\s+"\s*false\s*"\s*$/) { # 1 ? print "true" : print "false"
		return "SUCCESS !\n\r\n\r";
	} else {
		return "Try again...\n\r\n\r";
	}
}

1;

__DATA__
<h1>Ternary operator</h1>
<h2>Short if-then-else !</h2>
Let's introduce ternary operator !<br/><br/>
Maybe you know it from another language (C for instance)...<br/><br/>
So I let you try these examples :<br/>
<ul>
<li>Execute <i>then</i> : <code>0 ? print "true" : print "false"</code></li>
<li>Execute <i>else</i> : <code>1 ? print "true" : print "false"</code></li>
</ul>
</div>

<div id="lesson35">
<h1>Hash</h1>
<h2>Powerful tr(h)ash</h2>

There's a variable type that we do not mentionned yet... The famous <strong>hash</strong> !<br/><br/>
As other Perl variables, an <strong>hash</strong> is prefixed by a special symbol...<br/>I could let you guess what is the prefix but this time, it's not something really close to a <strong>H</strong>... as it's <strong>%</strong> ! <br/><br/>
So first define an empty hash <code>%empty = ()</code><br/><br/>

Then we will do something more useul <code>%h = ( key1 => "val1", key2 => "val2" )</code>

