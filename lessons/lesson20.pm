#!/usr/bin/env perl

# Inits here 
@jail::arr = ("c", "b", "a", "x", "y", "z"); # Extended, play with foreach/reverse/sort

sub answer($) {
	my $c = shift;
	if($c =~ m/^\s*foreach\s+\$v\s+\(\s*\@arr\s*\)\s*\{\s*print\s*\$v\s*\}\s*$/){ # foreach $v (@arr) { print $v }
		return "Good ! You perfectly used foreach ! \n\r\n\r";
	} elsif($c =~ m/^\s*for\s+\$v\s+\(\s*\@arr\s*\)\s*\{\s*print\s*\$v\s*\}\s*$/){ # for $v (@arr) { print $v }
		return "Great ! For could play as a foreach !\n\r\n\r";
	} elsif($c =~ m/^\s*for\s+\$v\s+\(\s*sort\s+\@arr\s*\)\s*\{\s*print\s*\$v\s*\}\s*$/){ # for $v (sort @arr) { print $v }
		return "SUCCESS !\n\r\n\r";
	} elsif($c =~ m/^\s*for\s+\$v\s+\(\s*reverse\s+\@arr\s*\)\s*\{\s*print\s*\$v\s*\}\s*$/){ # for $v (reverse @arr) { print $v }
		return "SUCCESS !\n\r\n\r";
	} else {
		return "Try again...\n\r\n\r";
	}
}

1;

__DATA__
<h1>For foreach</h1>

<h2>Foreach</h2>
What do we do with arrays ? We <u>iterate</u> over items !<br/><br/>
Let's time to introduce the foreach construction ! <br/><br/>
Perl foreach is extremly flexible and easy to use... <br/><br/>

Try this command : <code>foreach $v (@arr) { print $v }</code>

<h2>Foreach with for</h2>

The keyword <strong>foreach</strong> could be replaced by <strong>for</strong> without any problem.<br/>
<code>for $v (@arr) { print $v }</code><br/><br/>

We could also sort/reverse/whatever before iteration like this : 
<ul>
<li>Reverse :<code>for $v (reverse @arr) { print $v }</code><br/></li>
<li>Sort : <code>for $v (sort @arr) { print $v }</code></li>
</ul>

