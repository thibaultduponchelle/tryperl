#!/usr/bin/env perl

# Inits here 

sub answer($) {
	my $c = shift;
	if($c =~ m/^\s*\$u\s*=\s*undef\s*$/) { # $u = undef
		return "SUCCESS !\n\r\n\r";
	} else {
		return "Try again...\n\r\n\r"; 
	}
}

1;

__DATA__
<h1>One variable</h1>

<h2>Hello sigil</h2>

One thing that you have to know about Perl is that variables are prefixed by special a character.<br/>
You should see it as a good thing, because it allows variable interpolation into strings and helps programmer to know with what kind of data he's dealing with...<br/><br/>
The most common/simple variable is the <strong>scalar</strong> value and it's prefixed by a <strong>stricken through S</strong>.<br/><br/>
Perl users call it <strong>sigil</strong> but normal people call it <strong>dollar</strong>.<br/>
Here is the famous symbol : <strong>$</strong><br/><br/>

As we don't even talked about what could contain a scalar variable, let's declare an undefined variable !<br/><br/>

Declare your first variable like this : <code>$u = undef</code>

