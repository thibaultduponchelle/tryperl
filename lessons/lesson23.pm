#!/usr/bin/env perl

# Inits here 
$jail::a = "c"; # We play with individuals now
$jail::b = "b"; # Exchange values actually
$jail::c = "a"; #

sub answer($) {
	my $c = shift;
	if($c =~ m/^\s*\(\s*\$c\s*,\s*\$a\s*\)\s*=\s*\(\s*\$a\s*,\s*\$c\s*\)\s*$/) { # ( $c, $a ) = ( $a, $c )
		return "SUCCESS !\n\r\n\r";
	} elsif($c =~ m/^\s*\(\s*\$a\s*,\s*\$c\s*\)\s*=\s*\(\s*\$c\s*,\s*\$a\s*\)\s*$/) { # ( $a, $c ) = ( $c, $a )
		return "SUCCESS !\n\r\n\r";
	} elsif($c =~ m/^\s*\$a\s*$/) { # $a
		return "Not hard !\n\r\n\r";
	} elsif($c =~ m/^\s*\$b\s*$/) { # $b
		return "Easy win !\n\r\n\r";
	} elsif($c =~ m/^\s*\$c\s*$/) { # $c
		return "Ok you get it !\n\r\n\r";
	} else {
		return "Try again...\n\r\n\r";
	}
}

1;

__DATA__
<h1>Playing with items</h1>
<h2>Checking our extracted items</h2>

Now check that <strong>$a</strong>, <strong>$b</strong> and <strong>$c</strong> contains the right data : <br/>
<ul>
<li>Type <code>$a</code></li>
<li>Type <code>$b</code></li>
<li>Type <code>$c</code></li>
</ul>

The good news is <strong>$b</strong> produce "b" but we have some trouble with <strong>$a</strong> and <strong>$c</strong>... We need to switch them !

<h2>Exchange values</h2> 
I ask you to keep your eyes wide open because it's really beautiful !<br/><br/>

Type <code>($c, $a) = ($a, $c)</code> or <code>($a, $c) = ($c, $a)</code> 

