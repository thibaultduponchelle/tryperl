#!/usr/bin/env perl

# Inits here 
@jail::arr = ("c", "b"); # Popped, will push "a"

sub answer($) {
	my $c = shift;
	if($c =~ m/^\s*print\s+\@arr\s*$/){ # print @arr
		return "Last item was removed ! \n\r\n\r";
	} elsif($c =~ m/^\s*push\s+\@arr\s*,\s*"a"\s*$/){ # push @arr, "a"
		return "SUCCESS !\n\r\n\r";
	} else {
		return "Try again...\n\r\n\r";
	}
}

1;

__DATA__
<h1>Push a button</h1>
<h2>Push one</h2>

Now that we removed an item (check with <code>print @arr</code> if you want), we will just put it again in the array !<br/><br/>

Before to do that, I would remind you that : 
<ul>
<li><strong>push</strong> put data <i>at the end</i> of the array !</li>
<li>Array garantees that insertion order is kept.</li>
</ul>
<br/>
Now you can type <code>push @arr, "a"</code>

