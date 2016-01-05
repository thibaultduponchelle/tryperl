#!/usr/bin/env perl

# Inits here 

sub answer($) {
	my $c = shift;
	if($c =~ m/^\s*"-"\s*x\s*\d+\s*$/) { # "-" x 10
		return "Good ! It's sooo cooool right ?!\n\r\n\r";
	} elsif($c =~ m/^\s*\d+\s*x\s*\d+\s*$/) { # 42 x 10
		return "Converted to string then concatenated !\n\r\n\r";
	} elsif($c =~ m/^\s*\d+\s*\*\s*\d+\s*$/) { # 42 * 10
		return "Multiplication !\n\r\n\r";
	} elsif($c =~ m/^\s*"\/\\\\_"\s*x\s*\d+\s*$/) { # "/\_" x 10
		return "SUCCESS !\n\r\n\r";
	} else {
		return "Try again...\n\r\n\r";
	}
}

1;

__DATA__
<h1>Magic string </h1>
<h2>The magic x</h2>

Please welcome the <strong>magic x operator</strong> ! <br/><br/>

This operator is great, to be convinced, type <code>"-" x 40</code><br/><br/>

Take care that <strong>x</strong> (magic operator) is <i>not</i> <strong>*</strong> (multiply star).<br/>
Try <code>42 x 10</code> vs <code>42 * 10</code> !<br/><br/>

I can't resist to play more with this operator :)<br/><br/>

Type <code>"/\\_" x 20</code><br/>

