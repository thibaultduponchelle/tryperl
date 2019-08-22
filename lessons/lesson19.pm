#!/usr/bin/env perl

# Inits here 
@jail::arr = ("c", "b", "a"); # Push an array into the array

sub answer($) {
	my $c = shift;
	if($c =~ m/^\s*push\s+\@arr\s*,\s*\(\s*"x"\s*,\s*"y"\s*,\s*"z"\s*\)\s*$/){ # push @arr, ( "x", "y", "z" )
		return "SUCCESS !\n\r\n\r";
	} elsif($c =~ m/^\s*print\s+\@arr\s*$/){ # print @arr
		return "Good ! Last item is back !\n\r\n\r";
	} elsif($c =~ m/^\s*push\s+\@arr\s*,\s*\(\s*\)\s*$/){ # push @arr, ()
		return "Great ! It's totally useless but it works !\n\r\n\r";
	} else {
		return "Try again...\n\r\n\r";
	}
}

1;

__DATA__
<h1>Push Push !</h1>
<h2>Push several</h2>
If you want, quickly check array content with <code>print @arr</code> to see that it well contains "c" "b" "a" !<br/><br/>
There's even more to say about push...<br/><br/>
You're not limited to <strong>scalar</strong> values, you can push an array into another array !<br/><br/>

As a first excercice, please type <code>push @arr, ()</code><br/>
... But this is not really useful as it just adds nothing to our array :D<br/><br/>

The good example is this one <code>push @arr, ( "x", "y", "z" )</code><br/><br/>

