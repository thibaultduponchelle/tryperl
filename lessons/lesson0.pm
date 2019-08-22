#!/usr/bin/env perl

# Inits here 

sub answer($) {
	my $c = shift;
	if($c =~ m/^\s*\d+\s*\+\s*\d+\s*$/) { # 3 + 6
		return "Well done !\n\r\n\r";
	} elsif($c =~ m/^\s*"click me"\s*$/) { # "click me"
		return "LAZY ! LAZY ! LAZY ! xD\n\r\n\r";
	} else {
		return "Try again...\n\r\n\r";
	}
}

1;

__DATA__
<h1>Try Perl !</h1>
<h2>Initial</h2>

Welcome to <strong>Try Perl</strong> !<br/><br/>

The window on your right is an interactive Perl interpreter. <br/>
You can type Perl statements and watch it run. <br/><br/>
For your first try, type something like: <code>3 + 5</code><br/><br/>

<u>LAZY PEOPLE</u> : The code tags like <code>"click me"</code> are clickable, so you haven't to type every code snippets, risking a freaky typo... Just click on code tags to test it in the interpreter !

<h2>Rules</h2>

You could move to next lesson with a <code>next</code> and go back with <code>back</code><br/><br/>
You could restart to this page with <code>restart</code><br/><br/>
<u>When you're ready</u>, please type <code>next</code><br/>

