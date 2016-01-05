#!/usr/bin/env perl

# Inits here 

sub answer($) {
	my $c = shift;
	if($c =~ m/^\s*\\\\+\$\w+\s*$/) { # \\\\\\$s
		return "Curious ! But works !\n\r\n\r";
	} elsif($c =~ m/^\s*\\\\+\@\w+\s*$/) { # \\\\\\@a
		return "Strange ! But works !\n\r\n\r";
	} elsif($c =~ m/^\s*\\\\+\%\w+\s*$/) { # \\\\\\%a
		return "SUCCESS !\n\r\n\r";
	} else {
		return "Try again...\n\r\n\r";
	}
}

1;

__DATA__
<h1>Refs</h1>
<h2>Referencing</h2>
I will introduce references, but honestly I will do it quickly as references are not intented for beginners.<br/><br/>
For lucky C programmers, references are like pointers in C but with a key difference that it's not real memory location but some place relative to perl variable table.<br/>
It means that instead of playing with scalar, array or hash you will have a kind of key that is <i>referencing</i> to your data.<br/><br/>
The operator to reference a variable is <strong>\</strong> (backslash).<br/><br/>

There's no limitation in the number of reference levels for a variable...<br/><br/>
...But the good sense should prevent you to do some dummy <code>\\\\\\%h</code>

