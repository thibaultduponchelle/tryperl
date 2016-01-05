#!/usr/bin/env perl

# Inits here 
@jail::arr = ("c", "b", "a"); # Get item, multiple get

sub answer($) {
	my $c = shift;
	if($c =~ m/^\s*\(\s*\$a\s*,\s*\$b\s*,\s*\$c\s*\)\s*=\s*\@arr\s*$/) { # ( $a, $b, $c ) = @arr
		return "SUCCESS !\n\r\n\r";
	} elsif($c =~ m/^\s*\$arr\[[0|1|2]\]\s*$/) { # $arr[1]
		return "Good ! You're accessing an item of the array.\n\r\n\r";
	} else {
		return "Try again...\n\r\n\r";
	}
}

1;

__DATA__
<h1>Getting items</h1>
<h2>Accessing item</h2>

To access an item in the array, you could do a <code>$arr[1]</code>.<br/><br/>

Oh my God, why the prefixed symbol moved from <strong>@</strong> to <strong>$</strong> ?? <br/><br/>
Don't panic, keep calm and take a beer...<br/>
The symbol used depend from <u>what you want to access</u>, here we want a scalar value, so we use <strong>$</strong> !

<h2>Accessing multiple values</h2>
To get multiple values at once, there's a magic assignment in Perl, that produce jealousy from all other programming languages : <strong>Parallel multi assignment</strong> !<br/><br/>

Please try <code>($a, $b, $c) = @arr</code><br/><br/>
The left value of the assignment requests 3 variables, so Perl get 3 first items from <strong>@arr</strong>. And it handles correctly if there are few items and ignore extra items !Thank you Perl !

