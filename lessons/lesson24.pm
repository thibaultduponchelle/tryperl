#!/usr/bin/env perl

# Inits here 
$jail::a = "a"; # Print our values
$jail::b = "b"; #
$jail::c = "c"; #

sub answer($) {
	my $c = shift;
	if($c =~ m/^\s*print\s+"\s*\$a\s*\$b\s*\$c\s*"\s*$/) { # print $a$b$c
		return "Good ! You're mastering print !\n\r\n\r";
	} elsif($c =~ m/^\s*print\s+\$a\s*,\s*\$b\s*,\s*\$c\s*$/) { # print $a, $b, $c
		return "Great ! You're the print God !\n\r\n\r";
	} elsif($c =~ m/^\s*printf\s*\(\s*"\%s\s*\%s\s*\%s"\s*,\s*\$a\s*,\s*\$b\s*,\s*\$c\s*\)\s*$/) { # printf("%s%s%s", $a, $b, $c)
		return "SUCCESS !\n\r\n\r";
	} else {
		return "Try again...\n\r\n\r";
	}
}

1;

__DATA__
<h1>No more mess</h1>
<h2>Print exchanged values</h2>

Now we can print our data with switched values : 
<ul>
<li>With a classic <code>print "$a$b$c"</code></li>
<li>Or using commas like this <code>print $a, $b, $c</code></li>
<li>Or with formatted printf like <code>printf("%s%s%s", $a, $b, $c)</code></li>
</ul>

Note that printf will be more useful for formatting.<br/><br/>

That's all for this lesson ! <br/>

