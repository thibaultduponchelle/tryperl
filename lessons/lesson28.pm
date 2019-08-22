#!/usr/bin/env perl

# Inits here 
@jail::arr = ("c", "b", "a"); # Split

sub answer($) {
	my $c = shift;
	if($c =~ m/^\s*join\(\s*"-"\s*,\s*split\(\s*","\s*,\s*"\w+,\w+,\d+"\s*\)\s*\)\s*$/) { # join("-", split(",", "john,doe,30"))
		return "Good ! You split , then joined with dashes !\n\r\n\r";
	} elsif($c =~ m/^\s*join\(\s*"-"\s*,\s*split\(\s*"::"\s*,\s*"\w+::\w+::\d+"\s*\)\s*\)\s*$/) { # join("-", split(",", "john::doe::30"))
		return "Yeah ! You split :: then joined with dashes !\n\r\n\r";
	} elsif($c =~ m/^\s*join\(\s*"-"\s*,\s*split\(\s*","\s*,+\s*"\w+,+\w+,+\d+,*"\s*\)\s*\)\s*$/) { # join("-", split(",", "john,,doe,30,,,"))
		return "Wow ! It's really convenient isn't it ?\n\r\n\r";
	} elsif($c =~ m/^\s*\(\s*\$f\s*,\s*\$l\s*,\s*\$a\s*\)\s*=\s*split\(\s*","\s*,\s*"\w+,\w+,\d+"\s*\)\s*$/) { # ($f, $l, $a) = join("-", split(",", "john,doe,30,"))
		return "SUCCESS !\n\r\n\r";
	} else {
		return "Try again...\n\r\n\r";
	}
}

1;

__DATA__
<h1>Banana split</h1>
<h2>From raw to structured data</h2>

Manipulating string with Perl is extremely easy, I repeat !<br/><br/>

Let's discover the split keyword : <br/><br/>
<strong>split</strong> let you feed structured data from raw strings without too much effort !<br/>
The most typical example is <code>join("-", split(",", "john,doe,30"))</code><br/>
(Please note that we put a <strong>join</strong> to pretty print the result in this terminal)<br/><br/>
You can use whatever separator even multi characters separator : <br/><code>join("-", split("::", "john::doe::30"))</code><br/><br/>
Handling empty fields without any effort : <br/><code>join("-", split(",", "john,,doe,30,,,"))</code><br/><br/>
Then finally please retrieve split data in separate variables like this : <br/><code>($f, $l, $a) = split(",", "john,doe,30")</code>

