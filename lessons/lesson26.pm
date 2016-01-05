#!/usr/bin/env perl

# Inits here 
@jail::arr = ("c", "b", "a"); # Get last item

sub answer($) {
	my $c = shift;
	if($c =~ m/^\s*\$arr\[\$#arr\]\s*$/) { # $arr[$#arr]
		return "Good ! You got it !\n\r\n\r";
	} elsif($c =~ m/^\s*\$arr\[-1\]\s*$/) { # $arr[-1] 
		return "Good ! You're becoming a good perl hacker !\n\r\n\r";
	} elsif($c =~ m/^\s*\$arr\[\@arr-1\]\s*$/) { # $arr[@arr-1]
		return "SUCCESS !\n\r\n\r";
	} else {
		return "Try again...\n\r\n\r";
	}
}

1;

__DATA__
<h1>Endless</h1>
<h2>Last item</h2>

If we want the last item, whatever the index, we have several manner to do so :
<ul>
<li>We could do a <code>$arr[$#arr]</code></li>
<li>Or we could do a <code>$arr[-1]</code></li>
<li>Or even we could do a <code>$arr[@arr-1]</code></li>
</ul>

Yeah baby, there's more than one way to do it, remember !<br/><br/>

