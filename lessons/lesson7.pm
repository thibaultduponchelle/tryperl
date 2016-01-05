#!/usr/bin/env perl

# Inits here 
$jail::u = undef; # First declaration

sub answer($) {
	my $c = shift;
	if($c =~ m/^\s*\$\w+\s*=\s*\d+\s*$/) { # $i = 42
		return "SUCCESS !\n\r\n\r";
	} else {
		return "Try again...\n\r\n\r";
	}
}

1;

__DATA__
<h1>Weakly typed variables</h1>

<h2>Numbers</h2>

A scalar variable could contain a number whatever the precision it is.<br/>
Note that I'm talking about <strong>number</strong> and not <i>integer</i> or <i>floating</i> or <i>whatever</i>.<br/><br/>
Until you explicitely need precision (and in this case you need to explicitely set the precision or probably use a Math library...), Perl will simplify your task by taking care of these little things for you.

<h2>Declare a number</h2>
Declare a number like this : <code>$i = 42</code>

