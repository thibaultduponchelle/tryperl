#!/usr/bin/env perl

# Inits here 

sub answer($) {
	my $c = shift;
	if($c =~ m/^\s*sin\s+\-\d+\s*$/) { # sin 2
		return "SUCCESS !";
	} elsif($c =~ m/^\s*sin\s+\d+.\d+\s*$/) { # sin 2.2
		return "SUCCESS !";
	} elsif($c =~ m/^\s*cos\s+\d+\s*$/) { # cos 2
		return "SUCCESS !";
	} elsif($c =~ m/^\s*cos\s+\d+\.\d+\s*$/) { # cos 2.2
		return "SUCCESS !";
	} else {
		return "Try again...";
	}
}

1;

__DATA__
<h1>Basic Math</h1>
<h2>Some maths</h2>

Remember <i>easy things stay easy to do</i>.<br/><br/>

Obviously basic maths functions are availble in Perl.<br/>
So you will find builtins like <strong>sin</strong>, <strong>cos</strong>, etc... (<i>etc is not one of these !</i> :P)<br/><br/>

Please type <code>cos 2</code><br/><br/>

This is soooo easyyyyyy !

