#!/usr/bin/env perl

# Inits here 
@jail::arr = ("c", "b", "a"); # Join

sub answer($) {
	my $c = shift;
	if($c =~ m/^\s*join\(","\s*,\s*\@arr\s*\)\s*$/) { # join(",", @arr)
		return "Good ! Join join join :)\n\r\n\r";
	} elsif($c =~ m/^\s*join ","\s*,\s*\@arr\s*\s*$/) { # join ",", @arr
		return "Great ! Join join join :D\n\r\n\r";
	} elsif($c =~ m/^\s*join\(" <--> "\s*,\s*\@arr\s*\)\s*$/) { # join(" <--> ", @arr)
		return "SUCCESS !\n\r\n\r";
	} elsif($c =~ m/^\s*join " <--> "\s*,\s*\@arr\s*\s*$/) { # join " <--> ", @arr
		return "SUCCESS !\n\r\n\r";
	} else {
		return "Try again...\n\r\n\r";
	}
}

1;

__DATA__
<h1>String concatenation</h1>
<h2>Join</h2>

We still have our <strong>@arr</strong> filled with dummy "c", "b", "a"...<br/><br/>
But now I want to print array items separated by commas. But I don't want to handle parity (no commas at the end without item).<br/><br/>

Simply type <code>join(",",@arr)</code> or <code>join ",",@arr</code><br/><br/>
As I'm a joker, I propose that you could do something even weird like <code>join(" <--> ",@arr)</code> or <code>join " <--> ",@arr</code><br/><br/>
Perl is also known as <strong>practical extraction and report language</strong>, formatting data is extremely easy !<br/><br/>

Sky is the limit !<br/>

