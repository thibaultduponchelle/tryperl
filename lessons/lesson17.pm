#!/usr/bin/env perl

# Inits here 
@jail::arr = ("c", "b", "a"); # Shifted, pop "a"

sub answer($) {
	my $c = shift;
	if($c =~ m/^\s*print\s+\@arr\s*$/){ # print @arr
		return "Good ! Our array now contains cba without any onion !\n\r\n\r";
	} elsif($c =~ m/^\s*pop\s+\@arr\s*$/){ # pop @arr
		return "SUCCESS !\n\r\n\r";
	} else {
		return "Try again...\n\r\n\r";
	}
}

1;

__DATA__
<h1>Bubble pop</h1>
<h2>Pop an item</h2>

Perl obviously provides all necessary tools to push and pop items in an array !<br/>
In this lesson we will discover <strong>pop</strong>.<br/><br/>

First check what we now have inside our array with <code>print @arr</code><br/><br/>

Alriiight, now we can pop the last item <code>pop @arr</code>

