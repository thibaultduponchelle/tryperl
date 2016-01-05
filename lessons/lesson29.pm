#!/usr/bin/env perl

# Inits here 
$jail::f = "john"; # Print split result
$jail::l = "doe";  #
$jail::a = "30";   #

sub answer($) {
	my $c = shift;
	if($c =~ m/^\s*print\s+"\s*\$f\s*\$l\s*\$a\s*"\s*$/) { # print "$f$l$a"
		return "SUCCESS !\n\r\n\r";
	} else {
		return "Try again...\n\r\n\r";
	}
}

1;

__DATA__
<h1>Split result</h1>
<h2>Checking your split</h2>

Let's check the result of our split with <code>print "$f $l $a"</code><br/><br/>

This is soooo easyyyyyy !

