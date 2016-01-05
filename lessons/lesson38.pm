#!/usr/bin/env perl

# Inits here 

sub answer($) {
	my $c = shift;
	if($c =~ m/^\s*\\\$\w+\s*$/) { # \$s
		return "Yeah ! Perl tells you it's a scalar !\n\r\n\r";
	} elsif($c =~ m/^\s*\\\@\w+\s*$/) { # \@a
		return "Good ! Perl tells you it's an array !\n\r\n\r";
	} elsif($c =~ m/^\s*\\\%\w+\s*$/) { # \%h
		return "Nice ! Perl tells you it's an hash !\n\r\n\r";
	} elsif($c =~ m/^\s*\\\\\$\w+\s*$/) { # \\$s
		return "SUCCESS !\n\r\n\r";
	} elsif($c =~ m/^\s*\\\\\@\w+\s*$/) { # \\@a
		return "SUCCESS !\n\r\n\r";
	} elsif($c =~ m/^\s*\\\\\%\w+\s*$/) { # \\%h
		return "SUCCESS !\n\r\n\r";
	} else {
		return "Try again...\n\r\n\r";
	}
}

1;

__DATA__
<h1>Variable types</h1>
<h2>Scalar , arrays and hash !</h2>

Now that we have introduced variables, we will dig a bit more into it. <br/>
First we could inspect a variable type : 
<ul>
<li><code>\$s</code></li>
<li><code>\@a</code></li>
<li><code>\%h</code></li>
</ul>

Note that we forget about the fourth type which is the function type, but please ignore it at the moment.<br/><br/>
What we have is a <i>first level reference</i> it means that we get the key of the variable in the Perl internals, and we know that this key is pointing to a scalar, array or hash.<br/><br/>
Then try something like <code>\\$s</code> and see what we got for a <i>second level reference</i><br/>

