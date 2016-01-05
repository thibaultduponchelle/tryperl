#!/usr/bin/env perl

# Inits here 

sub answer($) {
	my $c = shift;
	if($c =~ m/^\s*reverse\s+"\s*\w+\s*"\s*$/) { # reverse "onion"
		return "SUCCESS !\n\r\n\r";
	} elsif($c =~ m/^\s*reverse\s+'\s*\w+\s*'\s*$/) { # reverse 'onion'
		return "SUCCESS !\n\r\n\r";
	} else {
		return "Try again...\n\r\n\r";
	}
}

1;

__DATA__
<h1>Reverse the onion</h1>
<h2>Discover</h2>
So you're new to Perl ? <br/><br/>
Honestly I envy you, discovering Perl was a big revelation in my IT engineer life...<br/><br/>

Perl is built upon some important <strong>principles</strong>, here are some :
<ul>
	<li>There's more than one way to do it. Best way is yours</li>
	<li>When we program, we generally play with strings and... Perl is primarly designed to play with strings. That's so coool!</li>
	<li>As far as possible, stay close to natural language (see Perl poetry)</li>
	<li>Perl is a glue language, allowing to launch shell commands is as easy than accessing SYSV IPC or low level sockets functions.</li>
</ul>

<h2>Start to manipulate things (onions ?! or chunky bacon :P)</h2>

Ok start right now without too much blah blah !<br/>
Your first exercice is simply to type <code>reverse "onion"</code> to reverse the string "onion". Remember that with Perl <i>easy things are easy to do</i>.

