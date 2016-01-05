#!/usr/bin/env perl

# Inits here 
@jail::arr = ("onion", "c", "b", "a"); # Shift

sub answer($) {
	my $c = shift;
	if($c =~ m/^\s*shift\s+\@arr\s*$/){ # shift @arr
		return "SUCCESS !\n\r\n\r";
	} elsif($c =~ m/^\s*print\s+\@arr\s*$/){ # print @arr
		return "Yeah ! Everything is well here including the onion !\n\r\n\r";
	} else {
		return "Try again...\n\r\n\r";
	}
}

1;

__DATA__
<h1>Onion removal</h1>
<h2>Shift</h2>
Before anything else, first have a look at our array with <code>print @arr</code><br/><br/>

I can't talk about arrays without immediately introduce <strong>shift</strong> keyword because you will simply see it almost everywhere in several Perl programs !<br/><br/>

Actually, this keyword does 2 things : 
<ul>
<li>Return the first item of the array</li>
<li>Remove the item from the array</li>
</ul>

Ok so let's start practical things. We prepared a <strong>@arr</strong> array with a dumb "onion" at the beginning...<br/><br/>
I don't want to see "onion" mixed with "c" "b" "a" so we will simply remove it with this command <code>shift @arr</code>

<h2>Unshift</h2>

<strong>shift</strong> has it counterpart <strong>unshift</strong> that put an item in an array !<br/>

