#!/usr/bin/env perl

# Inits here 
@jail::arr = ("c", "b", "a"); # Back to our dirty array, print sort

sub answer($) {
	my $c = shift;
	if($c =~ m/^\s*print\s+\@arr\s*$/) { # print @arr
		return "Great ! This array is dirty (sort of)\n\r\n\r";
	} elsif($c =~ m/^\s*print\s*\(\s+sort\s+\@arr\s+\)\s*$/) { # print (sort @arr)
		return "SUCCESS !\n\r\n\r";
	} else {
		return "Try again...\n\r\n\r";
	}
}

1;

__DATA__
<h1>Sorting</h1>
<h2>Check dirty array</h2>
While we played with <strong>$a</strong>, <strong>$b</strong> and <strong>$c</strong>, we forget about our initial <strong>@arr</strong>...<br/>
Let's check our <strong>@arr</strong> with <code>print @arr</code> to see that items are still in dumb order "c", "b", "a" !

<h2>Sort items</h2>
Then we could sort the array with <code>print( sort @arr )</code><br/><br/>

Soooo easyyyy right ?!

