#!/usr/bin/env perl

# Inits here 
@jail::arr = ("c", "b", "a", "x", "y", "z"); # Range then splice

sub answer($) {
	my $c = shift;
	if($c =~ m/^\s*print\s+\@arr\s*$/){ # print @arr
		return "Good ! There's a lot of items in our array now ! \n\r\n\r";
	} elsif($c =~ m/^\s*print\s+\@arr\s*\[\s*0\s*\.\.\s*2\s*\]\s*$/){ # print @arr[0..2]
		return "Great ! You're using perfectly the range operator ! \n\r\n\r";
	} elsif($c =~ m/^\s*\@arr\s*=\s*splice\s+\@arr\s*,\s*0+\s*,\s*0*3\s*$/){ # @arr = splice @arr, 0, 3
		return "SUCCESS !\n\r\n\r";
	} elsif($c =~ m/^\s*\@arr\s*=\s*splice\s+\@arr\s*,\s*\d+\s*,\s*\d+\s*$/){ # @arr = splice @arr, 2, 5
		return "No ! You have to splice with offset 0 and length 3 !\n\r\n\r";
	} elsif($c =~ m/^\s*\@arr\s*=\s*$/){ # @arr = 
		return "No ! You have to use splice like this : splice \@arr,0,3 !\n\r\n\r";
	} else {
		return "Try again...\n\r\n\r";
	}
}

1;

__DATA__
<h1>Splice and range</h1>

<h2>Range operator</h2>
We will play with <i>array portions</i> but first check the content of our extended array with <code>print @arr</code><br/><br/>

Then use range to get only 3 first items <code>print @arr[0..2]</code>

<h2>Pizza s(p)lice</h2>

Then we could start cutting the cake/onion/rope/whatever ! <br/><br/>
Go with this command <code>@arr = splice @arr, 0, 3</code><br/><br/>
(Note that <strong>3</strong> is the length where the <strong>2</strong> above in range was the index !) 

