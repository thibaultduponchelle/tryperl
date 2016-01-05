#!/usr/bin/env perl

# Inits here 
@jail::arr = ("onion", "c", "b", "a"); # Count array items

sub answer($) {
	my $c = shift;
	if($c =~ m/^\s*\@arr\s*$/) { # @arr
		return "The value returned is the number of items in the array !\n\r\n\r";
	} elsif($c =~ m/^\s*print\s+\@arr\s*$/) { # print @arr
		return "Yeah ! Here we say to Perl to print array as string !\n\r\n\r";
	} elsif($c =~ m/^\s*scalar\s+\@arr\s*$/) { # scalar @arr
		return "The value returned is the number of items in the array !\n\r\n\r";
	} elsif($c =~ m/^\s*\$#arr\s*$/) { # $#arr
		#return "The value returned is the last index in the array !\n\r\n\r";
		return "SUCCESS !\n\r\n\r";
	} else {
		return "Try again...\n\r\n\r";
	}
}

1;

__DATA__
<h1>Still arrays</h1>

<h2>Count items</h2>

While we have this array initialized, we could try a <code>@arr</code> and you will probably be a bit surprised by the result.<br/><br/>
If you want to inspect <strong>@arr content</strong> you have to say to perl that you want <code>print @arr</code> 
Another method to count the items is to convert the array to a scalar value <code>scalar @arr</code><br/><br/>
Finally I can't resist to show you one more method to know the length of the array...<br/> 
Type <code>$#arr</code> to go to the next lesson ! <br/>

