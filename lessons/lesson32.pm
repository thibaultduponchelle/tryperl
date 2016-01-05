#!/usr/bin/env perl

# Inits here 

sub answer($) {
	my $c = shift;
	if($c =~ m/^\s*\!\s*\(\s*0\s+or\s+"0"\s+or\s+0\.0\s+or\s+undef\s+or\s+\(\s*\)\s*\)\s*and\s+print\s+"\s*\w+\s*"\s*$/) { # !(0 or "0" or 0.0 or undef or ()) and print "false"
		return "Wow ! What a long command for a summary ! I'm impressed that you typed it !\n\r\n\r";
	} elsif($c =~ m/^\s*"\s+"\s+and\s+"\d+\.\d+"\s+and\s+1\s+and\s+"\s*\w+\s*"\s+and\s+print\s+"\s*\w+\s*"\s*$/) { # " " and "0.0" and 1 and "banana" and print "true" 
		return "SUCCESS !\n\r\n\r";
		# Actually I no longer ask user to type these following statements, but regex are still here at the moment
	} elsif($c =~ m/^\s*do\s*\{\s*print\s+"\w+"\s*\}\s*unless\s+"0"\s*$/) { # do { print "onion" } unless "0" 
		return "Good ! \"0\" is false !\n\r\n\r";
	} elsif($c =~ m/^\s*do\s*\{\s*print\s+"\w+"\s*\}\s*unless\s+0\s*$/) { # do { print "onion" } unless 0 
		return "Good ! 0 is false !\n\r\n\r";
	} elsif($c =~ m/^\s*do\s*\{\s*print\s+"\w+"\s*\}\s*unless\s+0+\.0+\s*$/) { # do { print "onion" } unless 0.0 
		return "Good ! 0.0 is false !\n\r\n\r";
	} elsif($c =~ m/^\s*do\s*\{\s*print\s+"\w+"\s*\}\s*unless\s+undef+\s*$/) { # do { print "onion" } unless undef 
		return "Good ! 0.0 is false !\n\r\n\r";
	} elsif($c =~ m/^\s*do\s*\{\s*print\s+"\w+"\s*\}\s*unless\s+"0.0"+\s*$/) { # do { print "onion" } unless "0.0" 
		return "Good ! \"0.0\" is true !\n\r\n\r";
	} elsif($c =~ m/^\s*do\s*\{\s*print\s+"\w+"\s*\}\s*unless\s+""+\s*$/) { # do { print "onion" } unless "" 
		return "Good ! \"\" is false !\n\r\n\r";
	} elsif($c =~ m/^\s*do\s*\{\s*print\s+"\w+"\s*\}\s*unless\s+\(\s*\)+\s*$/) { # do { print "onion" } unless () 
		return "Good ! Empty array () is false !\n\r\n\r";
	} elsif($c =~ m/^\s*do\s*\{\s*print\s+"\w+"\s*\}\s*if\s+"\s+"\s*$/) { # do { print "onion" } if " "
		return "Good ! \" \" is true !\n\r\n\r";
	} elsif($c =~ m/^\s*do\s*\{\s*print\s+"\w+"\s*\}\s*if\s+1+\s*$/) { # do { print "onion" } if 1 
		return "Good ! 1 is true !\n\r\n\r";
	} elsif($c =~ m/^\s*do\s*\{\s*print\s+"\w+"\s*\}\s*if\s+"\s*[123456789]+[0123456789]*\s*"+\s*$/) { # do { print "onion" } if "0123" 
		return "Good ! \"1\" is true !\n\r\n\r";
	} elsif($c =~ m/^\s*do\s*\{\s*print\s+"\w+"\s*\}\s*if\s+"\s*[0123456789]*[123456789]+\s*"+\s*$/) { # do { print "onion" } if "1000" 
		return "Good ! \"1\" is true !\n\r\n\r";
	} elsif($c =~ m/^\s*do\s*\{\s*print\s+"\w+"\s*\}\s*if\s+"\s*\w+\s*"+\s*$/) { # do { print "onion" } unless "0" 
		return "Good ! Various other strings are true !\n\r\n\r";
	} else {
		return "Try again...\n\r\n\r";
	}
}

1;

__DATA__
<h1>True lies</h1>
<h2>Who to trust ?</h2>

So now what is <strong>false</strong> : 
<ul>
<li>0 is false</li>
<li>"0" is false</li>
<li>0.0 is false</li>
<li>undef is false</li>
<li>Empty array () is false</li> 
</ul>

To summarize you can type (and note somewhere maybe) something like : <br/>
<code>!(0 or "0" or 0.0 or undef or ()) and print "false"</code><br/><br/>

So what is <strong>true</strong> ? 
<ul>
<li>" " is true</li>
<li>"0.0" is true</li>
<li>1 is true</li>
<li>"banana" is true</li>
</ul>

To summarize you can type something like : <br/>
<code>" " and "0.0" and 1 and "banana" and print "true"</code><br/><br/>

