#!/usr/bin/env perl

# Inits here 

sub answer($) {
	my $c = shift;
	if($c =~ m/^\s*\$tor\s*=\s*"onion\\n"\s*$/) { # $tor = "onion\n"
		return "SUCCESS !\n\r\n\r";
	} elsif($c =~ m/^\s*\$tor\s*=/) { # $tor = 
		return "Take care to correctly fill the \$tor variable with \"onion\\n\"\n\r\n\r";
	} elsif($c =~ m/\s*=\s*"onion\\n"\s*$/) { # = "onion\n"
			print "Put \"onion\\n\" inside a variable named \$tor variable\n\r\n\r";
	} else {
		return "Try again...\n\r\n\r";
	}
}

1;

__DATA__
<h1>Chomp chomp chomp</h1>

<h2>This is so smart</h2>

Everyday, every hours, every minutes... I'm <strong>chomping</strong> !<br/><br/>

This command provides you an EASY and SAFE way to remove extra trailing characters (generally carriage returns...). It means that you can use with eyes closed ! 

You must especially use it on data coming from : 
<ul>
<li>User input</li>
<li>From curl/ssh/whatever stdout capture from shell command execution</li>
<li>Or... coming from Mars since we discovered water on it... </li>
</ul>

<h2>Practical work</h2>
It's time to play with chomp, but before that, we need a variable... Please start with a variable declaration with one extra space at the end like this <code>$tor = "onion\n"</code>.

